require 'spec_helper'

describe Billogram::Payment do
  subject { described_class.new }

  it { is_expected.to respond_to(:bankgiro) }
  it { is_expected.to respond_to(:plusgiro) }
  it { is_expected.to respond_to(:domestic_bank_account) }
  it { is_expected.to respond_to(:international_bank_account) }
end
