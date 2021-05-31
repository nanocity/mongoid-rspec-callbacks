# frozen_string_literal: true

class Band
  include Mongoid::Document

  has_many :studio, {
    before_add: :send_notification_subscribers,
    after_add: :send_email_to_subscribers
  }

  has_many :members
  has_one :leader, class_name: 'Musician'

  def send_email_to_subscribers
    true
  end

  def send_email_to_unsubscribers
    true
  end
end
