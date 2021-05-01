# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Settings do
  it_behaves_like :resource_with_endpoint, 'settings'

  describe 'initialization' do
    subject(:settings) { described_class.new(fixture('settings')) }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:org_no) }

    it 'has relations' do
      expect(settings.tax).to be_a(Billogram::Tax)
      expect(settings.contact).to be_a(Billogram::Contact)
      expect(settings.address).to be_a(Billogram::Address)
      expect(settings.payment).to be_a(Billogram::Payment)
      expect(settings.bookkeeping).to be_a(Billogram::Bookkeeping)
      expect(settings.invoices).to be_a(Billogram::InvoiceDefaults)
    end
  end
end
