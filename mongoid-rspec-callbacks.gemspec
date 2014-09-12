# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid-rspec-callbacks/version"

Gem::Specification.new do |s|
  s.name        = "mongoid-rspec-callbacks"
  s.version     = Mongoid::Rspec::Callbacks::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luis Ciudad"]
  s.email       = %q{lciugar@gmail.com}
  s.homepage    = %q{https://github.com/nanocity/mongoid-rspec-callbacks}
  s.summary     = %q{Rspec matchers for Mongoid 4.x callbacks and Rails 4.x}
  s.description = %q{Callbacks RSpec matchers for Mongoid models}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency 'rake'
  s.add_dependency 'mongoid', '~> 4.0'
  s.add_dependency 'rspec', '~> 3.1'
end
