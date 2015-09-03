require 'spec_helper'

describe Billogram::InvoiceDefaults do
  subject { described_class.new }

  it { is_expected.to respond_to(:default_message) }
  it { is_expected.to respond_to(:default_interest_rate) }
  it { is_expected.to respond_to(:default_reminder_fee) }
  it { is_expected.to respond_to(:default_invoice_fee) }
  it { is_expected.to respond_to(:automatic_reminders) }
end
