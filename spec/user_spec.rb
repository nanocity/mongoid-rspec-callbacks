# frozen_string_literal: true

require 'spec_helper'

describe User do
  it { is_expected.to set_callback(:initialize, :after) }
  it { is_expected.to set_callback(:build, :after) }
  it { is_expected.to set_callback(:validation, :before) }
  it { is_expected.to set_callback(:validation, :after) }
  it { is_expected.to set_callback(:create, :before) }
  it { is_expected.to set_callback(:create, :arround) }
  it { is_expected.to set_callback(:create, :after) }
  it { is_expected.to set_callback(:find, :after) }
  it { is_expected.to set_callback(:update, :before) }
  it { is_expected.to set_callback(:update, :arround) }
  it { is_expected.to set_callback(:update, :after) }
  it { is_expected.to set_callback(:upsert, :before) }
  it { is_expected.to set_callback(:upsert, :arround) }
  it { is_expected.to set_callback(:upsert, :after) }
  it { is_expected.to set_callback(:save, :before) }
  it { is_expected.to set_callback(:save, :arround) }
  it { is_expected.to set_callback(:save, :after) }
  it { is_expected.to set_callback(:destroy, :before) }
  it { is_expected.to set_callback(:destroy, :arround) }
  it { is_expected.to set_callback(:destroy, :after) }
end
