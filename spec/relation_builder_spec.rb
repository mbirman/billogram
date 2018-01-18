require 'spec_helper'

describe Billogram::RelationBuilder do
  let(:resource) { Billogram::Invoice.new }
  let(:attributes) { {'customer' => {customer_no: 1}, 'items' => [{item_no: 1}, {item_no: 2}]} }
  
  subject { described_class.new(resource, attributes) }

  describe "#call" do
    it "sets 'one' relation" do
      expect{subject.call}.to change{resource.customer}.from(nil).to(Billogram::Customer)
    end

    it "sets 'many' relation" do
      items = [Billogram::Item, Billogram::Item]
      expect{subject.call}.to change{resource.items}.from(nil).to(items)
    end

    it "doesn't change relation if corresponding attribute is empty" do
      resource.events = [Billogram::Event.new]

      expect { subject.call }.to_not change { resource.events }
    end
  end
end
