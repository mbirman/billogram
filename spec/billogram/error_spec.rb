# frozen_string_literal: true

require 'spec_helper'

ERRORS = {
  'BadRequest' => 400,
  'Unauthorized' => 401,
  'Forbidden' => 403,
  'NotFound' => 404,
  'InternalServerError' => 500
}.freeze

describe Billogram::Error do
  subject { described_class.from_response(response) }

  let(:response) { fixture('error_response') }

  before do
    allow(response).to receive(:code).and_return(status)
  end

  ERRORS.each do |class_name, code|
    describe code.to_s do
      let(:status) { code }

      it { is_expected.to be_a("Billogram::Error::#{class_name}".constantize) }
    end
  end

  describe 'everything else' do
    let(:status) { 502 }
    let(:response) { { 'data' => nil } }

    it 'returns Error' do
      expect(described_class.from_response(response)).to be_a(described_class)
    end
  end
end
