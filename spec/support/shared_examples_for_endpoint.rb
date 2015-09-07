shared_examples_for "a resource with endpoint" do |endpoint|
  subject { described_class }

  describe ".endpoint" do
    after do
      subject.endpoint(endpoint)
    end

    describe "with parameter" do
      it "sets endpoint" do
        expect{subject.endpoint("test-value")}.to change{subject.endpoint}.from(endpoint).to('test-value')
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

  describe ".perform_request" do
    let(:query) { described_class.default_search_options }
    let(:request) { Billogram::Request.new(:get, endpoint, query) }

    before do
      allow(request).to receive(:execute).and_return({})
      allow(Billogram::Request).to receive(:new).and_return(request)
    end

    it "initializes a request" do
      expect(Billogram::Request).to receive(:new).with(:get, endpoint, query)
      described_class.perform_request(:get, endpoint, query)
    end

    it "returns objects" do
      expect(described_class).to receive(:build_objects).with({})
      described_class.perform_request(:get, endpoint, query)
    end
  end

  describe ".search" do
    describe "without parameters" do
      let(:search_params) { described_class.default_search_options }

      it "uses default options" do
        expect(described_class).to receive(:perform_request).with(:get, endpoint, search_params)
        described_class.search
      end
    end

    describe "with parameters" do
      let(:search_params) { { page_size: 5, page: 2} }

      it "overrides default options" do
        expect(described_class).to receive(:perform_request).with(:get, endpoint, search_params)
        described_class.search(search_params)
      end
    end
  end

  describe ".create" do
    it "calls #perform_request" do
      attrs = { field: 1, another: "value" }
      expect(subject).to receive(:perform_request).with(:post, endpoint, attrs)
      subject.create(attrs)
    end
  end

  describe ".fetch" do
    it "calls #perform_request" do
      expect(subject).to receive(:perform_request).with(:get, "#{endpoint}/1")
      subject.fetch(1)
    end
  end

  describe ".update" do
    it "calls #perform_request" do
      attrs = { field: 1, another: "value" }
      expect(subject).to receive(:perform_request).with(:put, "#{endpoint}/1", attrs)
      subject.update(1, attrs)
    end
  end

  describe ".delete" do
    it "calls #perform_request" do
      expect(subject).to receive(:perform_request).with(:delete, "#{endpoint}/1")
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
