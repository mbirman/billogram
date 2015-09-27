require 'spec_helper'

describe Billogram::Settings do
  it_behaves_like "a resource with endpoint", "settings"

  describe "initialization" do
    subject { described_class.new(fixture("settings")) }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:org_no) }
    

    it "has relations" do
      expect(subject.tax).to be_a(Billogram::Tax)
      expect(subject.contact).to be_a(Billogram::Contact)
      expect(subject.address).to be_a(Billogram::Address)
      expect(subject.payment).to be_a(Billogram::Payment)
      expect(subject.bookkeeping).to be_a(Billogram::Bookkeeping)
      expect(subject.invoices).to be_a(Billogram::InvoiceDefaults)
    end
  end
end
