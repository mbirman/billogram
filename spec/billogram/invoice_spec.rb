# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Invoice do
  subject(:invoice) { build(described_class, 'billogram') }

  it_behaves_like 'resource with endpoint', 'billogram'

  it { is_expected.to respond_to(:attachment) }
  it { is_expected.to respond_to(:attested_at) }
  it { is_expected.to respond_to(:automatic_reminders) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:creditor_unique_value) }
  it { is_expected.to respond_to(:currency) }
  it { is_expected.to respond_to(:delivery_method) }
  it { is_expected.to respond_to(:detailed_sums) }
  it { is_expected.to respond_to(:due_date) }
  it { is_expected.to respond_to(:due_days) }
  it { is_expected.to respond_to(:flags) }
  it { is_expected.to respond_to(:id) }
  it { is_expected.to respond_to(:interest_fee) }
  it { is_expected.to respond_to(:interest_rate) }
  it { is_expected.to respond_to(:invoice_date) }
  it { is_expected.to respond_to(:invoice_fee) }
  it { is_expected.to respond_to(:invoice_fee_vat) }
  it { is_expected.to respond_to(:invoice_no) }
  it { is_expected.to respond_to(:ocr_number) }
  it { is_expected.to respond_to(:offers) }
  it { is_expected.to respond_to(:pdf) }
  it { is_expected.to respond_to(:recipient_url) }
  it { is_expected.to respond_to(:remaining_sum) }
  it { is_expected.to respond_to(:reminder_count) }
  it { is_expected.to respond_to(:reminder_fee) }
  it { is_expected.to respond_to(:respite_date) }
  it { is_expected.to respond_to(:rounding_value) }
  it { is_expected.to respond_to(:sales_accepted) }
  it { is_expected.to respond_to(:show_item_gross_prices) }
  it { is_expected.to respond_to(:state) }
  it { is_expected.to respond_to(:total_sum) }
  it { is_expected.to respond_to(:updated_at) }
  it { is_expected.to respond_to(:url) }

  it { is_expected.to have_relation(:info, Billogram::Info) }
  it { is_expected.to have_relation(:items, Billogram::Item) }
  it { is_expected.to have_relation(:events, Billogram::Event) }
  it { is_expected.to have_relation(:customer, Billogram::Customer) }
  it { is_expected.to have_relation(:callbacks, Billogram::Callbacks) }
  it { is_expected.to have_relation(:detailed_sums, Billogram::DetailedSums) }
  it { is_expected.to have_relation(:regional_sweden, Billogram::RegionalSweden) }
  it { is_expected.to have_relation(:automatic_collection, Billogram::AutomaticCollection) }
  it { is_expected.to have_relation(:automatic_reminders_settings, Billogram::AutomaticReminder) }

  describe '#send!' do
    it 'sends request to /command/send' do
      path = "billogram/#{invoice.id}/command/send"
      options = { method: 'Email' }
      expect(described_class).to receive(:perform_request).with(:post, path, options)
      invoice.send!(**options)
    end
  end

  described_class::COMMANDS.each do |command|
    describe "##{command}" do
      it "sends request to /command/#{command}" do
        options = {}
        path = "#{described_class.endpoint}/#{invoice.id}/command/#{command}"
        expect(described_class).to receive(:perform_request).with(:post, path, options)

        invoice.send(command, options)
      end
    end
  end
end
