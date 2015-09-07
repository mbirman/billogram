require 'spec_helper'

describe Billogram::Error do
  let(:response) { fixture("error_response") }

  subject { described_class.from_response(response) }

  before do
    allow(response).to receive(:code).and_return(status)
  end

  describe "400" do
    let(:status) { 400 }

    it "returns BadRequest" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error::BadRequest)
    end
  end

  describe "401" do
    let(:status) { 401 }

    it "returns Unauthorized" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error::Unauthorized)
    end
  end

  describe "403" do
    let(:status) { 403 }

    it "returns Forbidden" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error::Forbidden)
    end
  end

  describe "404" do
    let(:status) { 404 }

    it "returns NotFound" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error::NotFound)
    end
  end

  describe "500" do
    let(:status) { 500 }

    it "returns InternalServerError" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error::InternalServerError)
    end
  end

  describe "everything else" do
    let(:status) { 502 }

    it "returns Error" do
      expect(described_class.from_response(response)).to be_a(Billogram::Error)
    end
  end
end
