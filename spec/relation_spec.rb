require 'spec_helper'

describe Billogram::Relation do
  describe "#relation_class" do
    subject { described_class.new(*params).relation_class }

    describe "one" do
      let(:params) { [:customer, :one] }

      it { is_expected.to eq(Billogram::Customer) }
    end

    describe "many" do
      let(:params) { [:items, :many] }

      it { is_expected.to eq(Billogram::Item) }
    end

    describe "with class override" do
      let(:params) { [:invoices, :one, class_override: "InvoiceDefaults"] }

      it { is_expected.to eq(Billogram::InvoiceDefaults) }
    end
  end
end
