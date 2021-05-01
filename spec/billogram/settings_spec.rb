# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Settings do
  subject { described_class.new(fixture('settings')) }

  it_behaves_like 'resource with endpoint', 'settings'

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:org_no) }

  it { is_expected.to have_relation(:tax, Billogram::Tax) }
  it { is_expected.to have_relation(:contact, Billogram::Contact) }
  it { is_expected.to have_relation(:address, Billogram::Address) }
  it { is_expected.to have_relation(:payment, Billogram::Payment) }
  it { is_expected.to have_relation(:bookkeeping, Billogram::Bookkeeping) }
  it { is_expected.to have_relation(:invoices, Billogram::InvoiceDefaults) }
  it { is_expected.to have_relation(:return_address, Billogram::Address) }
  it { is_expected.to have_relation(:invoice_address, Billogram::Address) }
  it { is_expected.to have_relation(:visiting_address, Billogram::Address) }
  it { is_expected.to have_relation(:registered_office_address, Billogram::Address) }
end
