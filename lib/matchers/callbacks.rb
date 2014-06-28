module Mongoid
  module Matchers
    class HaveCallbackMatcher
      KINDS = %w[ before around after ]

      def initialize( *args )
        @methods = args || []
      end

      def matches?( klass )
        return false unless @kind
        return false if @no_op = !klass.class.respond_to?( :"_#{@operation}_callbacks" )

        @guess = nil
        @methods.each do |method|
          filter = klass.class.send( :"_#{@operation}_callbacks" ).detect do |c|
            @guess = c if c.filter == method

            options = c.try(:options) || {}

            c.filter == method and c.kind == @kind and options[:on] == @on
          end

          return false unless filter
        end
      end

      KINDS.each do |kind|
        define_method( kind.to_sym ) do |op|
          @operation = op
          @kind = kind.to_sym
          self
        end
      end

      def on( action )
        @on = action
        self
      end

      def failure_message_for_should
        failure_message( true )
      end

      def failure_message_for_should_not
        failure_message( false )
      end

      def description
        msg = "call #{@methods.join(", ")}"
        msg << " #{@kind} #{@operation}" if @operation
        msg << " on #{@on}" if @on
        msg
      end

      protected
      def failure_message( should )
        return "Invalid operation. Use :initialize, :build, :validation,"\
               ":create, :find, :update, :upsert, :save or :destroy" if @no_op

        if @kind
          options = @guess.try(:options)
          msg =  "Expected method#{@methods.size > 1 ? 's' : ''} #{@methods.join(", ")} #{should ? '' : 'not ' }to be called"
          msg << " #{@kind} #{@operation}" if @operation
          msg << " on #{@on}" if @on
          msg << ( @guess ? ", but got method #{@guess.filter} called" : ", but no callback found" )
          msg << " #{@guess.kind} #{@operation}" if @guess
          msg << " on #{options[:on]}" if @guess and options[:on]

          msg
        else
          "Callback#{@methods.size > 1 ? 's' : '' } #{@methods.join(", ")} can"\
          "not be tested against undefined lifecycle. Use .before, .after or .around"
        end
      end

    end

    def callback( *args )
      HaveCallbackMatcher.new( *args )
    end
  end
end
