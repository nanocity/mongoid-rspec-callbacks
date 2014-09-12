mongoid-rspec-callbacks
=

http://rubygems.org/gems/mongoid-rspec-callbacks

RSpec Callbacks matchers for Mongoid 4.x and Rails 4.x.

This gem is meant to be use with [mongoid-rpsec](http://rubygems.org/gems/mongoid-rspec), altought it works by itself.

Syntax is the same as [shoulda-callback-matchers](https://github.com/beatrichartz/shoulda-callback-matchers).

By now, only ``on`` option is supported.

Installation
-

Add to your Gemfile

    gem 'mongoid-rspec'
    gem 'mongoid-rspec-callbacks'

Drop in existing or dedicated support file in spec/support (spec/support/mongoid.rb)

    RSpec.configure do |configuration|
      configuration.include Mongoid::Matchers
    end

Callbacks Matchers
-

    describe User do
      it { should callback(:method).before(:save) }
      it { should callback(:method).after(:save) }
      it { should callback(:method, :method2).before(:validation) }
      it { should callback(:method).after(:validation).on(:create) }
    end
