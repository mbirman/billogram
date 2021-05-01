# frozen_string_literal: true

require 'spec_helper'

describe Billogram::DomesticBankAccount do
  it { is_expected.to respond_to(:account_no) }
  it { is_expected.to respond_to(:clearing_no) }
end
