# frozen_string_literal: true

module Mongoid
  module Matchers
    # Create an matcher for set_callback method
    #
    # Usage:
    #
    # it { is_expected.to association_callback(:has_many,
    #                                          :add,
    #                                          :after,
    #                                          :send_email_to_subscribers)  }
    class HaveAssociationCallbackMatcher
      CONTEXTS = %i[before after].freeze
      OPERATIONS = %i[add remove].freeze
      RELATIONS = %i[embeds_many has_many and has_and_belongs_to_many].freeze

      def initialize(*args)
        @relation = args[0]
        @type = args[1]
        @hook = args[2]
        @method = args[3]
      end

      def matches?(klass)
        @model = klass

        return false unless \
          relation_is_correct? ||
          context_is_correct? ||
          operation_is_correct? ||
          callback_is_correct?

        testings_presence_method_callback
      end

      def description
        "be association_callback(:#{@type}, :#{@hook})"
      end

      def failure_message
        message_error
      end

      def failure_message_when_negated
        message_error
      end

      private

      def relation_is_correct?
        RELATIONS.include?(@relation)
      end

      def context_is_correct?
        CONTEXTS.include?(@hook)
      end

      def operation_is_correct?
        OPERATIONS.include?(@type)
      end

      def callback_is_correct?
        @model.class.respond_to?(:"_#{@type}_callbacks")
      end

      def testings_presence_method_callback
        @model.methods.include?(:"#{@method}")
      end

      def message_error
        <<-ERROR
  expected #{@model} have method callback to association :
    has_many <relation>, #{@hook}: :#{@method}

    def #{@method}
    end
        ERROR
      end
    end

    def association_callback(*args)
      HaveAssociationCallbackMatcher.new(*args)
    end
  end
end
