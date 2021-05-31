# frozen_string_literal: true

module Mongoid
  module Rspec
    module Callbacks
      module Dazzl
        # Define version to gem
        VERSION = '1.0.1'

        # Name to gem
        GEM_NAME = 'mongoid-rspec-callbacks-dazzl'

        # Authors
        AUTHORS = ['VAILLANT Jeremy'].freeze

        # Emails
        EMAILS = ['jeremy@dazzl.tv'].freeze

        # Licence
        LICENSE = 'GPL-3.0'

        # Define a summary description to gem
        SUMMARY = 'RSpec Callbacks matchers for Mongoid'

        # Define a long description to gem
        DESCRIPTION = <<-DESC
        This gem is meant to be use with mongoid-rpsec,
        altought it works by itself. Syntax is the same
        as shoulda-callback-matchers.
        DESC

        # Define homepage
        HOMEPAGE = 'http://github.com/dazzl-tv/mongoid-rspec-callbacks'
      end
    end
  end
end
