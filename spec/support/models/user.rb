# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  set_callback(:initialize, :after)
  set_callback(:build, :after)
  set_callback(:validation, :before)
  set_callback(:validation, :after)
  set_callback(:create, :before)
  set_callback(:create, :arround)
  set_callback(:create, :after)
  set_callback(:find, :after)
  set_callback(:update, :before)
  set_callback(:update, :arround)
  set_callback(:update, :after)
  set_callback(:upsert, :before)
  set_callback(:upsert, :arround)
  set_callback(:upsert, :after)
  set_callback(:save, :before)
  set_callback(:save, :arround)
  set_callback(:save, :after)
  set_callback(:destroy, :before)
  set_callback(:destroy, :arround)
  set_callback(:destroy, :after)

  belongs_to :studio
end
