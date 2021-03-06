# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: mongoid-rspec-callbacks 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mongoid-rspec-callbacks"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Luis Ciudad"]
  s.date = "2016-03-09"
  s.description = "This gem is meant to be use with mongoid-rpsec, altought it works by itself. Syntax is the same as shoulda-callback-matchers."
  s.email = "lciugar@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "COPYING",
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/matchers/callbacks.rb",
    "lib/mongoid-rspec-callbacks.rb",
    "lib/mongoid-rspec-callbacks/version.rb",
    "mongoid-rspec-callbacks.gemspec",
    "spec/callbacks_spec.rb",
    "spec/models/user.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/nanocity/mongoid-rspec-callbacks"
  s.licenses = ["GPLv3"]
  s.rubygems_version = "2.4.8"
  s.summary = "RSpec Callbacks matchers for Mongoid 3.X"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_runtime_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<mongoid>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 4.2"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<mongoid>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 4.2"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<mongoid>, [">= 0"])
  end
end

