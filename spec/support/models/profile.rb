# frozen_string_literal: true

class Profile
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  include Mongoid::Attributes::Dynamic

  before_save :callback_before_save
  after_save :callback_after_save

  before_validation :callback_before_validation, :callback_before_validation_x
  after_validation :callback_after_validation, on: :create

  def callback_before_save
    true
  end

  def callback_after_save
    true
  end

  def callback_before_validation
    true
  end

  def callback_before_validation_x
    true
  end

  def callback_after_validation
    true
  end
end
