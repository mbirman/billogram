# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Customer do
  subject { build(described_class) }

  it_behaves_like 'resource with endpoint', 'customer'

  it { is_expected.to respond_to(:customer_no) }
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:phone) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:notes) }
  it { is_expected.to respond_to(:org_no) }
  it { is_expected.to respond_to(:vat_no) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:company_type) }
  it { is_expected.to respond_to(:language) }

  it { is_expected.to alias_id(:customer_no) }

  it { is_expected.to have_relation(:contact, Billogram::Contact) }
  it { is_expected.to have_relation(:address, Billogram::Address) }
  it { is_expected.to have_relation(:delivery_address, Billogram::Address) }
  it { is_expected.to have_relation(:payment_settings, Billogram::PaymentSettings) }
end
