require 'mongoid-rspec-callbacks'
require 'models/user'

RSpec.configure do |config|
  config.include Mongoid::Matchers
end
