require 'spec_helper'

describe Billogram::Request do
  let(:params) { { attribute: "value"} }
  subject { described_class.new(:get, "test", params) }

  its(:type) { is_expected.to eq(:get) }
  its(:url) { is_expected.to eq("test") }
  its(:params) { is_expected.to eq(params)}

  describe "#execute" do
    it "fires Billgoram client" do
      expect(Billogram.client).to receive(:send).with(:get, "test", {query: params})
      subject.execute
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
