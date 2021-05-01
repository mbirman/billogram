# frozen_string_literal: true

require 'spec_helper'

describe Billogram::InternationalBankAccount do
  it { is_expected.to respond_to(:bank) }
  it { is_expected.to respond_to(:iban) }
  it { is_expected.to respond_to(:bic) }
  it { is_expected.to respond_to(:swift) }
end
