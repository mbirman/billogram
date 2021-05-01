# frozen_string_literal: true

require 'spec_helper'

describe Billogram::RelationBuilder do
  subject(:relation_builder) { described_class.new(resource, attributes) }

  let(:resource) { Billogram::Invoice.new }
  let(:attributes) do
    {
      'customer' => { customer_no: 1 },
      'items' => [{ item_no: 1 }, { item_no: 2 }]
    }
  end

  describe '#call' do
    it "sets 'one' relation" do
      expect { relation_builder.call }.to change(resource, :customer).from(nil).to(Billogram::Customer)
    end

    it "sets 'many' relation" do
      items = [Billogram::Item, Billogram::Item]
      expect { relation_builder.call }.to change(resource, :items).from(nil).to(items)
    end

    it "doesn't change relation if corresponding attribute is empty" do
      resource.events = [Billogram::Event.new]

      expect { relation_builder.call }.not_to change(resource, :events)
    end
  end
end
