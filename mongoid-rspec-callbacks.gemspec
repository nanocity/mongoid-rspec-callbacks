# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mongoid-rspec-callbacks-dazzl/info'

Gem::Specification.new do |spec|
  version = Mongoid::Rspec::Callbacks::Dazzl::VERSION
  spec.version      = if ENV.key?('GITHUB_RUN_ID') &&
                         !ENV['GITHUB_REF'].eql?('refs/heads/master')
                        "#{version}.pre.#{ENV['GITHUB_RUN_ID']}"
                      else
                        version
                      end
  spec.name         = Mongoid::Rspec::Callbacks::Dazzl::GEM_NAME
  spec.authors      = Mongoid::Rspec::Callbacks::Dazzl::AUTHORS
  spec.email        = Mongoid::Rspec::Callbacks::Dazzl::EMAILS

  spec.summary      = Mongoid::Rspec::Callbacks::Dazzl::SUMMARY
  spec.description  = Mongoid::Rspec::Callbacks::Dazzl::DESCRIPTION

  spec.homepage     = Mongoid::Rspec::Callbacks::Dazzl::HOMEPAGE
  spec.license      = Mongoid::Rspec::Callbacks::Dazzl::LICENSE

  spec.files        = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md', 'COPYING']
  spec.files        += Dir['lib/**/*']
  spec.files        += Dir['spec/**/*']

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_development_dependency 'pry-byebug', '~> 3.9'
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
  spec.add_dependency 'mongoid-rspec', '~> 4.1'
end
