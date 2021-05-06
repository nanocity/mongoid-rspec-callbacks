# frozen_string_literal: true

module Mongoid
  module Matchers
    # Create an matcher for set_callback method
    #
    # Usage:
    #
    # it { is_expected.to set_callback(:save, :arround)  }
    # it { is_expected.to set_callback(:validation, :after)  }
    class HaveSetCallbackMatcher
      CONTEXTS = %i[before arround after].freeze
      OPERATIONS = %i[initialize build validation create
                      find update upsert save destroy].freeze

      def initialize(*args)
        @type = args[0]
        @hook = args[1]
      end

      def matches?(klass)
        @model = klass

        return false unless \
          context_is_correct? ||
          operation_is_correct? ||
          callback_is_correct?

        testings_presence_callback
      end

      def description
        "be set_callback(:#{@type}, :#{@hook})"
      end

      def failure_message
        message_error
      end

      def failure_message_when_negated
        message_error
      end

      private

      def context_is_correct?
        CONTEXTS.include?(@hook)
      end

      def operation_is_correct?
        OPERATIONS.include?(@type)
      end

      def callback_is_correct?
        @model.class.respond_to?(:"_#{@type}_callbacks")
      end

      def testings_presence_callback
        @model.class.send("_#{@type}_callbacks".to_sym).select do |cb|
          cb.filter.eql?(@hook.to_sym)
        end
      end

      def message_error
        <<-ERROR
  expected #{@model} have method callback :
    set_callback(:#{@type}, :#{@hook}) |document|
      # My callback execution ...
    end
        ERROR
      end
    end

    def set_callback(*args)
      HaveSetCallbackMatcher.new(*args)
    end
  end
end
