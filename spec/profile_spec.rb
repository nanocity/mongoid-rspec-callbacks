# frozen_string_literal: true

require 'spec_helper'

describe Profile do
  it { is_expected.to callback(:callback_before_save).before(:save) }
  it { is_expected.to callback(:callback_after_save).after(:save) }
  it { is_expected.to callback(:callback_before_validation, :callback_before_validation_x).before(:validation) }
  it { is_expected.to callback(:callback_after_validation).after(:validation).on(:create) }
end
