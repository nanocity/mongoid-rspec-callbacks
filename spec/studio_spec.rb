# frozen_string_literal: true

require 'spec_helper'

describe Studio do
  it { is_expected.to association_callback(:has_many, :remove, :after, :send_notification_subscribers) }
  it { is_expected.to association_callback(:has_many, :remove, :before, :send_notification_unsubscribers) }
end
