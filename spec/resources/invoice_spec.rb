require 'spec_helper'

describe Billogram::Invoice do
  subject { described_class.new(fixture("billogram")) }

  its(:endpoint) { is_expected.to eq('billogram') }

  describe "commands" do
    describe "#send!" do
      it "sends request to /command/send" do
        path = "billogram/#{subject.id}/command/send"
        options = { method: 'Email' }
        expect(described_class).to receive(:perform_request).with(path, :post, options)
        subject.send!(options)
      end
    end

    it_behaves_like 'commandable object', :sell
    it_behaves_like 'commandable object', :collect
    it_behaves_like 'commandable object', :writeoff
    it_behaves_like 'commandable object', :payment, { amount: 1 }
    it_behaves_like 'commandable object', :credit, { mode: 'full' }
    it_behaves_like 'commandable object', :resend, { method: 'Email' }
    it_behaves_like 'commandable object', :remind, { method: 'Email' }
    it_behaves_like 'commandable object', :message, { message: 'test' }
    it_behaves_like 'commandable object', :attach, { filename: 'invoice.pdf', content: '' }
  end

  describe "relations" do
    its(:info) { is_expected.to be_a(Billogram::Info) }
    its(:items) { is_expected.to include(Billogram::Item) }
    its(:events) { is_expected.to include(Billogram::Event) }
    its(:customer) { is_expected.to be_a(Billogram::Customer) }
    its(:callbacks) { is_expected.to be_a(Billogram::Callbacks) }
    its(:detailed_sums) { is_expected.to be_a(Billogram::DetailedSums) }
    its(:regional_sweden) { is_expected.to be_a(Billogram::RegionalSweden) }
  end

  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:flags) }
  it { is_expected.to respond_to(:due_days) }
  it { is_expected.to respond_to(:currency) }
  it { is_expected.to respond_to(:due_date) }
  it { is_expected.to respond_to(:total_sum) }
  it { is_expected.to respond_to(:invoice_no) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:ocr_number) }
  it { is_expected.to respond_to(:attachment) }
  it { is_expected.to respond_to(:attested_at) }
  it { is_expected.to respond_to(:invoice_fee) }
  it { is_expected.to respond_to(:invoice_date) }
  it { is_expected.to respond_to(:reminder_fee) }
  it { is_expected.to respond_to(:interest_fee) }
  it { is_expected.to respond_to(:interest_rate) }
  it { is_expected.to respond_to(:remaining_sum) }
  it { is_expected.to respond_to(:reminder_count) }
  it { is_expected.to respond_to(:rounding_value) }
  it { is_expected.to respond_to(:invoice_fee_vat) }
  it { is_expected.to respond_to(:delivery_method) }
  it { is_expected.to respond_to(:automatic_reminders) }
end
