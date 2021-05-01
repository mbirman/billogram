# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Invoice do
  it_behaves_like :resource_with_endpoint, 'billogram'

  describe 'commands' do
    subject(:invoice) { described_class.new(fixture('billogram')) }

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

  describe 'initialization' do
    subject(:invoice) { described_class.new(fixture('billogram')) }

    it 'has relations' do
      expect(invoice.info).to be_a(Billogram::Info)
      expect(invoice.items).to include(Billogram::Item)
      expect(invoice.events).to include(Billogram::Event)
      expect(invoice.customer).to be_a(Billogram::Customer)
      expect(invoice.callbacks).to be_a(Billogram::Callbacks)
      expect(invoice.detailed_sums).to be_a(Billogram::DetailedSums)
      expect(invoice.regional_sweden).to be_a(Billogram::RegionalSweden)
      expect(invoice.automatic_collection).to be_a(Billogram::AutomaticCollection)
      expect(invoice.automatic_reminders_settings).to include(Billogram::AutomaticReminder)
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
end
