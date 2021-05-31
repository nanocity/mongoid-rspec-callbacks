# frozen_string_literal: true

class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  delegate :day, prefix: 'date', to: :created_at
  delegate :lastday, prefix: 'update', to: :updated_at

  belongs_to :band
  belongs_to :leader, class_name: 'band'
end
