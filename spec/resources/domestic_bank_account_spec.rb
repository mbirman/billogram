require 'spec_helper'

describe Billogram::DomesticBankAccount do
  subject { described_class.new }

  it { is_expected.to respond_to(:account_no) }
  it { is_expected.to respond_to(:clearing_no) }
end
