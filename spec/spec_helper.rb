# frozen_string_literal: true

require 'mongoid_rspec_callbacks_dazzl'
require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

Dir['spec/support/**/*.rb'].each do |f|
  require File.expand_path(f)
end

RSpec.configure do |config|
  # Stop when rspec fail
  config.fail_fast = false

  # Exclude spec broken
  config.filter_run_excluding broken: true

  # Include matchers
  config.include Mongoid::Matchers
end
