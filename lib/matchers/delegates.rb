# frozen_string_literal: true

module Mongoid
  module Matchers
    # Create an matcher for delegate method
    #
    # Usage:
    #
    # it { is_expected.to delegate(:name).to(:author) }
    # it { is_expected.to delegate(:day).to(:created_at).with_prefix(:date) }
    class HaveDelegateMatcher
      # Set methods to look for
      def initialize(*args)
        @delegated = args[0]
        @method = @delegated
      end

      def to(to)
        @to = to
        self
      end

      def with_prefix(prefix)
        @prefix = prefix
        @method = :"#{@prefix}_#{@method}"
        self
      end

      def matches?(klass)
        @delegator = klass
        @delegator.methods.include?(@method)
      end

      def description
        "delegate : #{@method}"
      end

      def failure_message
        "expected #{@delegator} have delegator #{_method}"
      end

      def failure_message_when_negated
        "expected #{@delegator} have not to delegator :#{@method} #{prefix?}"
      end

      private

      def _method
        if @prefix
          ":#{@delegated} with prefix :#{@prefix}"
        else
          ":#{@delegated}"
        end
      end

      def prefix?
        @prefix ? ' with prefix' : ''
      end
    end

    def delegate(*args)
      HaveDelegateMatcher.new(*args)
    end
  end
end
