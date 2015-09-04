require 'spec_helper'

describe Billogram::Relation do
  describe "one" do
    subject { described_class.new(:customer, :one) }

    its(:relation_class) { is_expected.to eq(Billogram::Customer) }
  end

  describe "many" do
    subject { described_class.new(:items, :many) }

    its(:relation_class) { is_expected.to eq(Billogram::Item) }
  end

  describe "with class override" do
    subject { described_class.new(:invoices, :one, class_override: "InvoiceDefaults") }

    its(:relation_class) { is_expected.to eq(Billogram::InvoiceDefaults) }
  end
end
