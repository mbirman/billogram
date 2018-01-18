require 'spec_helper'

describe Billogram::AutomaticReminder do
  it { is_expected.to respond_to(:message) }
  it { is_expected.to respond_to(:delay_days) }
end
