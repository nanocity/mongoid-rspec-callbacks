# frozen_string_literal: true

class Band
  include Mongoid::Document

  has_many :studio, {
    before_add: :send_notification_subscribers,
    after_add: :send_email_to_subscribers,
    before_remove: :send_notification_unsubscribers,
    after_remove: :send_email_to_unsubscribers
  }

  def send_email_to_subscribers
    true
  end

  def send_email_to_unsubscribers
    true
  end

  def send_notification_subscribers
    true
  end

  def send_notification_unsubscribers
    true
  end
end
