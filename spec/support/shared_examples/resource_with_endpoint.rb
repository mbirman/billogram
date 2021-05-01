# frozen_string_literal: true

shared_examples_for 'resource with endpoint' do |endpoint|
  describe '.endpoint' do
    after do
      described_class.endpoint(endpoint)
    end

    describe 'with parameter' do
      it 'sets endpoint' do
        expect { described_class.endpoint('test-value') }
          .to change { described_class.endpoint }.from(endpoint).to('test-value')
      end

      it "doesn't change endpont to nil" do
        described_class.endpoint('test-value')
        expect { described_class.endpoint(nil) }.to_not change { described_class.endpoint }
      end
    end

    describe 'without parameter' do
      it 'returns previous value' do
        described_class.endpoint('test_endpoint')
        expect(described_class.endpoint).to eq('test_endpoint')
      end
    end
  end

  describe '.perform_request' do
    let(:query) { described_class.default_search_options }
    let(:request) { Billogram::Request.new(:get, endpoint, query) }

    before do
      allow(request).to receive(:execute).and_return({})
      allow(Billogram::Request).to receive(:new).and_return(request)
    end

    it 'initializes a request' do
      expect(Billogram::Request).to receive(:new).with(:get, endpoint, query)
      described_class.perform_request(:get, endpoint, query)
    end

    it 'returns objects' do
      expect(described_class).to receive(:build_objects).with({})
      described_class.perform_request(:get, endpoint, query)
    end
  end

  describe '.search' do
    describe 'without parameters' do
      let(:search_params) { described_class.default_search_options }

      it 'uses default options' do
        expect(described_class).to receive(:perform_request).with(:get, endpoint, search_params)
        described_class.search
      end
    end

    describe 'with parameters' do
      let(:search_params) { { page_size: 5, page: 2 } }

      it 'overrides default options' do
        expect(described_class).to receive(:perform_request).with(:get, endpoint, search_params)
        described_class.search(search_params)
      end
    end
  end

  describe '.create' do
    it 'calls #perform_request' do
      attrs = { field: 1, another: 'value' }
      expect(described_class).to receive(:perform_request).with(:post, endpoint, attrs)
      described_class.create(attrs)
    end
  end

  describe '.fetch' do
    it 'calls #perform_request' do
      expect(described_class).to receive(:perform_request).with(:get, "#{endpoint}/1")
      described_class.fetch(1)
    end
  end

  describe '#update' do
    let(:resource) { described_class.new }

    before do
      allow(resource).to receive(:id).and_return(1)
    end

    it 'forwards method call to the class' do
      expect(described_class).to receive(:perform_request).with(:put, "#{endpoint}/#{resource.id}", {})
      resource.update({})
    end
  end
end
