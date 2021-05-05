# frozen_string_literal: true

module Mongoid
  module Matchers
    # Create an matcher for callback method
    #
    # Usage:
    #
    # it { is_expected.to callback(:callback1).before(:save) }
    # it { is_expected.to callback(:callback2).after(:save) }
    # it { is_expected.to callback(:callback1, :callback2).before(:validation) }
    # it { is_expected.to callback(:callback3).after(:validation).on(:create) }
    class HaveCallbackMatcher
      KINDS = %w[before around after].freeze

      # Set methods to look for
      def initialize(*args)
        @methods = args || []
      end

      # Set when callback is fired using @kind and @operation
      KINDS.each do |kind|
        define_method(kind.to_sym) do |op|
          @operation = op
          @kind = kind.to_sym
          self
        end
      end

      # Set on condition
      def on(action)
        @context = action
        self
      end

      def matches?(klass)
        return false unless @kind
        if @no_op == !klass.class.respond_to?(:"_#{@operation}_callbacks")
          return false
        end

        @guess = nil
        @methods.each do |method|
          filter = filters_method(klass, method)

          return false unless filter
        end
      end

      def failure_message
        message(true)
      end

      def failure_message_when_negated
        message(false)
      end

      def description
        methods = @methods

        "be callback(:#{methods.join(', ')})#{expl_operation}#{expl_context}"
      end

      protected

      def expl_operation
        @operation ? ".#{@kind}(:#{@operation})" : ''
      end

      def expl_context
        @context ? ".on(:#{@context})" : ''
      end

      def message(should)
        return msg_op_invalid if @no_op

        @kind ? message_kind(should) : message_not_kind
      end

      def msg_op_invalid
        'Invalid operation. Use :initialize, :build, :validation,' \
        ':create, :find, :update, :upsert, :save or :destroy'
      end

      def message_kind(should)
        <<-MESSAGE
          Expected method#{@methods.size > 1 ? 's' : ''}#{expr_called(should)}
            #{"#{@kind}" "#{@operation}" if @operation}
            #{"on #{@context}" if @context}
            #{msg_guess}
            #{"#{@guess.kind}   #{@operation}" if @guess}
            #{'on another context' if @guess && !@context_match}
        MESSAGE
      end

      def expr_called(should)
        "#{@methods.join(', ')} #{should ? '' : 'not '}to be called"
      end

      def msg_guess
        if @guess
          ", but got method #{@guess.filter} called"
        else
          ', but no callback found'
        end
      end

      def message_not_kind
        <<-MESSAGE
          Callback#{@methods.size > 1 ? 's' : ''} #{@methods.join(', ')} can
          not be tested against undefined lifecycle.
          Use .before, .after or .around
        MESSAGE
      end

      private

      def filters_method(klass, method)
        klass.class.send(:"_#{@operation}_callbacks").detect do |callback|
          # Save callback instance in order to print information
          # about it in case of failure
          @guess = callback if callback.filter == method
          check_filter?(callback,
                        method) and check_kind?(callback,
                                                @kind) and check_context?(
                                                  callback, @context
                                                )
        end
      end

      def check_filter?(callback, method)
        callback.filter == method
      end

      def check_kind?(callback, kind)
        callback.kind == kind
      end

      def check_context?(callback, context)
        return true unless context

        options = callback.instance_variable_get(:@if)
        @context_match = options.select do |o|
          o.is_a?(Proc)
        end

        @context_match.detect do |o|
          o.call(ValidationContext.new(context))
        end
      end
    end

    ValidationContext = Struct.new :validation_context

    def callback(*args)
      HaveCallbackMatcher.new(*args)
    end
  end
end
