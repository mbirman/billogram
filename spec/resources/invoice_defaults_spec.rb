# frozen_string_literal: true

require 'spec_helper'

describe Billogram::InvoiceDefaults do
  subject { described_class.new(fixture('settings')['invoices']) }

  it { is_expected.to respond_to(:default_message) }
  it { is_expected.to respond_to(:default_interest_rate) }
  it { is_expected.to respond_to(:default_reminder_fee) }
  it { is_expected.to respond_to(:default_invoice_fee) }

  it 'has relations' do
    expect(subject.automatic_reminders).to include(Billogram::AutomaticReminder)
  end
end
