# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Request do
  subject(:request) { described_class.new(:get, 'test', params) }

  let(:params) { { attribute: 'value' } }

  describe '#execute' do
    before do
      allow(request).to receive(:response).and_return(response)
    end

    describe 'successfull' do
      let(:data) { { name: 'Bill' } }
      let(:response) { OpenStruct.new(success?: true, data: data) }

      it 'returns data hash' do
        expect(request.execute).to eq(data)
      end
    end

    describe 'failed' do
      let(:response) { OpenStruct.new(success?: false, code: 500, data: {}) }

      it 'raises Billogram::Error' do
        expect { request.execute }.to raise_error(Billogram::Error)
      end
    end
  end

  describe 'content' do
    subject(:content) { described_class.new(verb, 'test', params).content }

    describe 'GET' do
      let(:params) { { test: 123 } }
      let(:verb) { :get }

      it { is_expected.to eq(query: params) }
    end

    describe 'POST' do
      let(:params) { { test: 123 } }
      let(:verb) { :post }

      it { is_expected.to eq(body: params.to_json) }
    end

    describe 'PUT' do
      let(:params) { { test: 123 } }
      let(:verb) { :put }

      it { is_expected.to eq(body: params.to_json) }
    end

    describe 'DELETE' do
      let(:params) { {} }
      let(:verb) { :delete }

      it { is_expected.to eq({}) }
    end
  end
end