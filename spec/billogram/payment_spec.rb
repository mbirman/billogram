# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Payment do
  subject { described_class.new(fixture('settings').fetch('payment')) }

  it { is_expected.to respond_to(:bankgiro) }
  it { is_expected.to respond_to(:plusgiro) }

  it { is_expected.to have_relation(:domestic_bank_account, Billogram::DomesticBankAccount) }
  it { is_expected.to have_relation(:international_bank_account, Billogram::InternationalBankAccount) }
end
