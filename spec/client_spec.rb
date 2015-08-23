require 'spec_helper'

describe Billogram::Client do
  subject { Billogram.client }

  describe ".handle_request" do
    describe "with status 200" do
      it "returns attributes hash" do
        stub_get("/billogram/bla").to_return(json_response("billogram.json"))
        response = subject.get("/billogram/bla")
        expect(response).to be_kind_of(Hash)
        expect(response["id"]).to eq("gQjEEZL")
      end
    end

    describe "with errors" do
      it "raises 404" do
      stub_get("/not_found").to_return(status: 404)
      expect{subject.get("/not_found")}.to raise_error(Billogram::Error::NotFound)
    end

      it "raises 505" do
        stub_get("/boom").to_return(status: 500)
        expect{subject.get("/boom")}.to raise_error(Billogram::Error::InternalServerError)
      end
    end
  end
end
