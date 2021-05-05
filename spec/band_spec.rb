# frozen_string_literal: true

require 'spec_helper'

describe Band do
  it { is_expected.to association_callback(:has_many,
                                           :add,
                                           :after,
                                           :send_email_to_subscribers) }
end
