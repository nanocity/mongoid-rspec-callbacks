# frozen_string_literal: true

class Studio
  include Mongoid::Document

  belongs_to :band

  has_many :user, {
    before_remove: :send_notification_unsubscribers,
    after_remove: :send_email_to_unsubscribers
  }

  def send_notification_subscribers
    true
  end

  def send_notification_unsubscribers
    true
  end
end
