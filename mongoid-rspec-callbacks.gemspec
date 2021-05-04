# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mongoid-rspec-callbacks/info'

Gem::Specification.new do |spec|
  spec.version = if ENV['GITHUB_REF'].eql?('refs/heads/develop')
                   "#{Mongoid::Rspec::Callbacks::VERSION}." \
                     "pre.#{ENV['GITHUB_RUN_ID']}"
                 else
                   Mongoid::Rspec::Callbacks::VERSION
                 end
  spec.name         = Mongoid::Rspec::Callbacks::GEM_NAME
  spec.authors      = Mongoid::Rspec::Callbacks::AUTHORS
  spec.email        = Mongoid::Rspec::Callbacks::EMAILS

  spec.summary      = Mongoid::Rspec::Callbacks::SUMMARY
  spec.description  = Mongoid::Rspec::Callbacks::DESCRIPTION

  spec.homepage     = Mongoid::Rspec::Callbacks::HOMEPAGE
  spec.license      = Mongoid::Rspec::Callbacks::LICENSE

  spec.files        = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md', 'COPYING']
  spec.files        += Dir['lib/**/*']
  spec.files        += Dir['spec/**/*']

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'reek', '~> 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.13.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.11', '>= 1.11.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'simplecov_json_formatter', '~> 0.1.3'

  spec.add_runtime_dependency 'activesupport', '~> 6.1.3.1'
  spec.add_dependency 'mongoid', '~> 7.2', '>= 7.2.2'
end
