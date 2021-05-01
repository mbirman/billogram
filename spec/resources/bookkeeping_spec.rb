require 'spec_helper'

describe Billogram::Bookkeeping do
  subject { described_class.new(fixture('bookkeeping')) }

  it { is_expected.to respond_to(:income_account_for_vat_25) }
  it { is_expected.to respond_to(:income_account_for_vat_12) }
  it { is_expected.to respond_to(:income_account_for_vat_6) }
  it { is_expected.to respond_to(:income_account_for_vat_0) }
  it { is_expected.to respond_to(:income_account) }
  it { is_expected.to respond_to(:reversed_vat_account) }
  it { is_expected.to respond_to(:vat_account_for_vat_25) }
  it { is_expected.to respond_to(:vat_account_for_vat_12) }
  it { is_expected.to respond_to(:vat_account_for_vat_6) }
  it { is_expected.to respond_to(:vat_account) }
  it { is_expected.to respond_to(:account_receivable_account) }
  it { is_expected.to respond_to(:client_funds_account) }
  it { is_expected.to respond_to(:banking_account) }
  it { is_expected.to respond_to(:interest_fee_account) }
  it { is_expected.to respond_to(:reminder_fee_account) }
  it { is_expected.to respond_to(:rounding_account) }
  it { is_expected.to respond_to(:factoring_receivable_account) }

  it 'has relations' do
    expect(subject.regional_sweden).to be_a(Billogram::RegionalSweden)
  end
end
