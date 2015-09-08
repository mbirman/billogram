require 'spec_helper'

describe Billogram::Request do
  let(:params) { { attribute: "value"} }

  subject { described_class.new(:get, "test", params) }

  describe "#execute" do
    before do
      allow(subject).to receive(:response).and_return(response)
    end

    describe "successfull" do
      let(:data) { {name: "Bill" } }
      let(:response) { OpenStruct.new(success?: true, data: data) }

      it "returns data hash" do
        expect(subject.execute).to eq(data)
      end
    end

    describe "failed" do
      let(:response) { OpenStruct.new(success?: false, code: 500, data: {}) }

      it "raises Billogram::Error" do
        expect{subject.execute}.to raise_error(Billogram::Error)
      end
    end
  end

  describe "content" do
    describe "GET" do
      let(:params) { { test: 123 } }
      subject { described_class.new(:get, "test", params) }

      its(:content) { is_expected.to eq({query: params}) }
    end

    describe "POST" do
      let(:params) { { test: 123 } }
      subject { described_class.new(:post, "test", params) }

      its(:content) { is_expected.to eq({body: params.to_json}) }
    end

    describe "PUT" do
      let(:params) { { test: 123 } }
      subject { described_class.new(:put, "test", params) }

      its(:content) { is_expected.to eq({body: params.to_json}) }
    end

    describe "DELETE" do
      subject { described_class.new(:delete, "test/1") }

      its(:content) { is_expected.to eq({}) }
    end
  end
end
