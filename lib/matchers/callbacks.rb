
# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable layyout/LineLength
# rubocop:disable Lint/AssignmentInCondition
# rubocop:disable Metrics/AbcSize
# rubocop:disable Style/Documentation
module Mongoid
  module Matchers
    class HaveCallbackMatcher
      # Ensure that the given model has a callback defined for the given method/s
      # callback(:method1, :method2).after(:validation).on(:create)
      #               @methods       @kind  @operation     @context

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
        if @no_op = !klass.class.respond_to?(:"_#{@operation}_callbacks")
          return false
        end

        @guess = nil
        @methods.each do |method|
          filter = klass.class.send(:"_#{@operation}_callbacks").detect do |callback|
            # Save callback instance in order to print information
            # about it in case of failure
            @guess = callback if callback.filter == method
            check_filter?(callback,
                          method) and check_kind?(callback,
                                                  @kind) and check_context?(
                                                    callback, @context
                                                  )
          end

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
        msg = "call #{@methods.join(', ')}"
        msg << " #{@kind} #{@operation}" if @operation
        msg << " on #{@context}" if @context
        msg
      end

      protected

      def message(should)
        if @no_op
          return 'Invalid operation. Use :initialize, :build, :validation,'\
                 ':create, :find, :update, :upsert, :save or :destroy'
        end

        if @kind
          msg =  "Expected method#{@methods.size > 1 ? 's' : ''} " \
            "#{@methods.join(', ')} #{should ? '' : 'not '}to be called"
          msg << " #{@kind} #{@operation}" if @operation
          msg << " on #{@context}" if @context
          msg << (@guess ? ", but got method #{@guess.filter} called" : ', but no callback found')
          msg << " #{@guess.kind} #{@operation}" if @guess
          msg << ' on another context' if @guess && !@context_match

          msg
        else
          <<-MSG
            Callback#{@methods.size > 1 ? 's' : ''} #{@methods.join(', ')} can
            not be tested against undefined lifecycle.
            Use .before, .after or .around
          MSG
        end
      end

      private

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
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable layyout/LineLength
# rubocop:enable Lint/AssignmentInCondition
# rubocop:enable Metrics/AbcSize
# rubocop:enable Style/Documentation
