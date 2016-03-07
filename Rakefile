require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "mongoid-rspec-callbacks"
  gem.homepage = "http://github.com/nanocity/mongoid-rspec-callbacks"
  gem.license = "GPLv3"
  gem.summary = %Q{RSpec Callbacks matchers for Mongoid 3.X}
  gem.description = %Q{This gem is meant to be use with mongoid-rpsec, altought it works by itself. Syntax is the same as shoulda-callback-matchers.}
  gem.email = "lciugar@gmail.com"
  gem.authors = ["Luis Ciudad"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
