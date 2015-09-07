require 'spec_helper'

describe Billogram::Settings do
  it_behaves_like "a resource with endpoint", "settings"

  describe "initialization" do
    subject { described_class.new(fixture("settings")) }

    its(:endpoint) { is_expected.to eq('settings') }


    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:org_no) }
    

    describe "relations" do
      subject { described_class.new(fixture("settings")) }

      its(:tax) { is_expected.to be_a(Billogram::Tax) }
      its(:contact) { is_expected.to be_a(Billogram::Contact) }
      its(:address) { is_expected.to be_a(Billogram::Address) }
      its(:payment) { is_expected.to be_a(Billogram::Payment) }
      its(:bookkeeping) { is_expected.to be_a(Billogram::Bookkeeping) }
      its(:invoices) { is_expected.to be_a(Billogram::InvoiceDefaults) }
    end
  end
end
