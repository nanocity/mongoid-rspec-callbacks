# frozen_string_literal: true

class Profile
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  include Mongoid::Attributes::Dynamic

  before_save :callback1
  after_save :callback2

  before_validation :callback1, :callback2
  after_validation :callback3, on: :create

  def callback1
    true
  end

  def callback2
    true
  end

  def callback3
    true
  end
end
