# Mongoid::Rspec::Callbacks
  [![RSpec](https://github.com/dazzl-tv/mongoid-rspec-callbacks/actions/workflows/rspec.yml/badge.svg?branch=develop&event=pull_request)](https://github.com/dazzl-tv/mongoid-rspec-callbacks/actions/workflows/rspec.yml)
  [![Linter](https://github.com/dazzl-tv/mongoid-rspec-callbacks/actions/workflows/linter.yml/badge.svg)](https://github.com/dazzl-tv/mongoid-rspec-callbacks/actions/workflows/linter.yml)
  [![Gem Version](https://badge.fury.io/rb/mongoid-rspec-callbacks.svg)](https://badge.fury.io/rb/mongoid-rspec-callbacks)
  [![Docs](https://inch-ci.org/github/dazzl-tv/mongoid-rspec-callbacks.svg)](https://inch-ci.org/github/dazzl-tv/mongoid-rspec-callbacks)
  [![Maintainability](https://api.codeclimate.com/v1/badges/2538546ea7419c1d5ea1/maintainability)](https://codeclimate.com/github/dazzl-tv/mongoid-rspec-callbacks/maintainability)
  [![Test Coverage](https://api.codeclimate.com/v1/badges/2538546ea7419c1d5ea1/test_coverage)](https://codeclimate.com/github/dazzl-tv/mongoid-rspec-callbacks/test_coverage)
  [![Known Vulnerabilities](https://snyk.io/test/github/dazzl-tv/mongoid-rspec-callbacks/badge.svg)](https://snyk.io/test/github/dazzl-tv/mongoid-rspec-callbacks)

http://rubygems.org/gems/mongoid-rspec-callbacks

RSpec Callbacks matchers for Mongoid 7.x and ActiveSupport 6.x

This gem is meant to be use with [mongoid-rpsec](http://rubygems.org/gems/mongoid-rspec), altought it works by itself.

Syntax is the same as [shoulda-callback-matchers](https://github.com/beatrichartz/shoulda-callback-matchers).

By now, only ``on`` option is supported.

## Installation

Add to your Gemfile

    gem 'mongoid-rspec'
    gem 'mongoid-rspec-callbacks'

Drop in existing or dedicated support file in spec/support (spec/support/mongoid.rb)

    RSpec.configure do |configuration|
      configuration.include Mongoid::Matchers
    end

## Callbacks Matchers

    describe User do
      it { should callback(:method).before(:save) }
      it { should callback(:method).after(:save) }
      it { should callback(:method, :method2).before(:validation) }
      it { should callback(:method).after(:validation).on(:create) }
    end
