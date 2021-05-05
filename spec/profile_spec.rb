# frozen_string_literal: true

require 'spec_helper'

describe Profile do
  it { is_expected.to callback(:callback1).before(:save) }
  it { is_expected.to callback(:callback2).after(:save) }
  it { is_expected.to callback(:callback1, :callback2).before(:validation) }
  it { is_expected.to callback(:callback3).after(:validation).on(:create) }
end
