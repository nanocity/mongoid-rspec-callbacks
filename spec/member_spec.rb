# frozen_string_literal: true

require 'spec_helper'

describe Member do
  it { is_expected.to delegate(:day).to(:created_at).with_prefix(:date) }
  it { is_expected.to delegate(:lastday).to(:updated_at).with_prefix(:update) }
end
