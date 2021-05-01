# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Data do
  it { is_expected.to respond_to(:invoice_no) }
  it { is_expected.to respond_to(:delivery_method) }
  it { is_expected.to respond_to(:letter_id) }
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to respond_to(:payer_name) }
  it { is_expected.to respond_to(:banking_amount) }
  it { is_expected.to respond_to(:manual) }
  it { is_expected.to respond_to(:reminder_fee) }
  it { is_expected.to respond_to(:reminder_count) }
  it { is_expected.to respond_to(:interest_rate) }
  it { is_expected.to respond_to(:customer_email) }
  it { is_expected.to respond_to(:ip) }
  it { is_expected.to respond_to(:type) }
  it { is_expected.to respond_to(:message) }
  it { is_expected.to respond_to(:message) }
  it { is_expected.to respond_to(:collector_method) }
  it { is_expected.to respond_to(:collector_reference) }
  it { is_expected.to respond_to(:factoring_method) }
  it { is_expected.to respond_to(:factoring_reference) }
  it { is_expected.to respond_to(:sells_for) }
  it { is_expected.to respond_to(:sold_for) }
  it { is_expected.to respond_to(:total_sum) }
  it { is_expected.to respond_to(:remaining_sum) }
  it { is_expected.to respond_to(:scanning_central) }
end
