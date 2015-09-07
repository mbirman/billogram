require 'spec_helper'

describe Billogram::Resource do
  subject { described_class }

  describe ".build_objects" do
    subject { described_class.build_objects(argument) }

    describe "when hash given" do
      let(:argument) { {attribute: 'test'} }
      it { is_expected.to be_a(Billogram::Resource)}
    end

    describe "when array given" do
      let(:argument) { [{item_no: 1}, {item_no: 2}] }

      it { is_expected.to be_a(Array) }

      it "returns array of instances" do
        subject.each do |item|
          expect(item).to be_a(Billogram::Resource)
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

  describe ".relation" do
    before do
      subject.relation(:one_relation, :one)
      subject.relation(:many_relations, :many)
    end

    it "defines attr_accessors" do
      expect(subject.new).to respond_to(:one_relation)
      expect(subject.new).to respond_to(:many_relations)
    end

    it "adds relation to class variable" do
      expect(subject.relations).to include(Billogram::Relation)
    end
  end
end
