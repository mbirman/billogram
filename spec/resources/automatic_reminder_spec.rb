require 'spec_helper'

describe Billogram::AutomaticReminder do
  subject { described_class.new({message: "Test", delay_days: "5"}) }

  it { is_expected.to respond_to(:message) }
  it { is_expected.to respond_to(:delay_days) }
end
