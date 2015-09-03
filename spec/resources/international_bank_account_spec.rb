require 'spec_helper'

describe Billogram::InternationalBankAccount do
  subject { described_class.new }

  it { is_expected.to respond_to(:bank) }
  it { is_expected.to respond_to(:iban) }
  it { is_expected.to respond_to(:bic) }
  it { is_expected.to respond_to(:swift) }
end
