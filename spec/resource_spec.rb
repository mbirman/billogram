require 'spec_helper'

describe Billogram::Resource do
  subject { described_class }

  describe ".build_objects" do
    subject { described_class.build_objects(argument) }

    describe "when hash given" do
      let(:argument) { {attribute: 'test'} }

      it { is_expected.to be_kind_of(Billogram::Resource)}
    end

    describe "when array given" do
      let(:argument) { [{item_no: 1}, {item_no: 2}] }

      it { is_expected.to be_kind_of(Array) }

      it "returns array of instances" do
        subject.each do |item|
          expect(item).to be_kind_of(Billogram::Resource)
        end
      end
    end

    describe "when nil given" do
      let(:argument) { nil }

      it { is_expected.to be_nil }
    end

    describe "when string given" do
      let(:argument) { "test" }

      it { is_expected.to eq("test")}
    end
  end

  describe ".endpoint" do
    describe "with parameter" do
      it "sets endpoint" do
        expect{subject.endpoint("test-value")}.to change{subject.endpoint}.from("resources").to('test-value')
      end

      it "doesn't change endpont to nil" do
        subject.endpoint("test-value")
        expect{subject.endpoint(nil)}.to_not change{subject.endpoint}
      end
    end

    describe "without parameter" do
      it "returns previous value" do
        subject.endpoint("test_endpoint")
        expect(subject.endpoint).to eq("test_endpoint")
      end
    end
  end
  
  describe ".relation" do
    before do
      subject.relation(:one_relation)
      subject.relation(:many_relations, :many)
    end

    it "defines attr_accessors" do
      expect(subject.new).to respond_to(:one_relation)
      expect(subject.new).to respond_to(:many_relations)
    end

    it "adds relation to class variable" do
      expect(subject.relations).to include({one: [:one_relation], many: [:many_relations]})
    end
  end
end
