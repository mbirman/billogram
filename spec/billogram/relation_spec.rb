# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Relation do
  describe '#relation_class' do
    describe 'one' do
      subject { described_class.new(:customer, :one).relation_class }

      it { is_expected.to eq(Billogram::Customer) }
    end

    describe 'many' do
      subject { described_class.new(:items, :many).relation_class }

      it { is_expected.to eq(Billogram::Item) }
    end

    describe 'with class override' do
      subject { described_class.new(:invoices, :one, class_override: 'InvoiceDefaults').relation_class }

      it { is_expected.to eq(Billogram::InvoiceDefaults) }
    end
  end
end
