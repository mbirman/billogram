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

  describe ".endpoint" do
    after do
      subject.endpoint("resource")
    end

    describe "with parameter" do
      it "sets endpoint" do
        expect{subject.endpoint("test-value")}.to change{subject.endpoint}.from("resource").to('test-value')
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

  describe ".perform_request" do
    let(:query) { described_class::DEFAULT_SEARCH_OPTIONS }
    let(:request) { Billogram::Request.new(:get, "resource", query) }

    before do
      allow(request).to receive(:execute).and_return({})
      allow(Billogram::Request).to receive(:new).and_return(request)
    end

    it "initializes a request" do
      expect(Billogram::Request).to receive(:new).with(:get, "resource", query)
      described_class.perform_request(:get, "resource", query)
    end

    it "returns objects" do
      expect(described_class).to receive(:build_objects).with({})
      described_class.perform_request(:get, "resource", query)
    end
  end

  describe ".search" do
    describe "without parameters" do
      let(:search_params) { described_class::DEFAULT_SEARCH_OPTIONS }

      it "uses default options" do
        expect(described_class).to receive(:perform_request).with(:get, "resource", search_params)
        described_class.search
      end
    end

    describe "with parameters" do
      let(:search_params) { { page_size: 5, page: 2} }

      it "overrides default options" do
        expect(described_class).to receive(:perform_request).with(:get, "resource", search_params)
        described_class.search(search_params)
      end
    end
  end

  describe ".create" do
    it "calls #perform_request" do
      attrs = { field: 1, another: "value" }
      expect(subject).to receive(:perform_request).with(:post, "resource", attrs)
      subject.create(attrs)
    end
  end

  describe ".fetch" do
    it "calls #perform_request" do
      expect(subject).to receive(:perform_request).with(:get, "resource/1")
      subject.fetch(1)
    end
  end

  describe ".update" do
    it "calls #perform_request" do
      attrs = { field: 1, another: "value" }
      expect(subject).to receive(:perform_request).with(:put, "resource/1", attrs)
      subject.update(1, attrs)
    end
  end

  describe ".delete" do
    it "calls #perform_request" do
      expect(subject).to receive(:perform_request).with(:delete, "resource/1")
      subject.delete(1)
    end
  end

  describe "#update" do
    let(:resource) { described_class.new }

    before do
      allow(resource).to receive(:id).and_return(1)
    end

    it "forwards method call to the class" do
      expect(subject).to receive(:update).with(resource.id, {})
      resource.update({})
    end
  end

  describe "#delete" do
    let(:resource) { described_class.new }

    before do
      allow(resource).to receive(:id).and_return(1)
    end

    it "forwards method call to the class" do
      expect(subject).to receive(:delete).with(resource.id)
      resource.delete
    end
  end
end
