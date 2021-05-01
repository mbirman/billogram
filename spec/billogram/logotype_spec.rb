# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Logotype do
  it_behaves_like 'resource with endpoint', 'logotype'

  describe '.upload' do
    let(:params) { { content: '', file_type: 'image/png' } }

    it 'is alias of .create' do
      expect(described_class).to receive(:create).with(params)
      described_class.upload(params)
    end
  end
end
