# frozen_string_literal: true

require 'mongoid_rspec_callbacks'
require 'models/user'
require 'simplecov'
require 'simplecov_json_formatter'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

RSpec.configure do |config|
  # Stop when rspec fail
  config.fail_fast = true

  # Exclude spec broken
  config.filter_run_excluding broken: true

  config.include Mongoid::Matchers
end
