# frozen_string_literal: true

class Studio
  include Mongoid::Document

  belongs_to :band
end
