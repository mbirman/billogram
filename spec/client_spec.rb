require 'spec_helper'

describe Billogram::Client do
  subject { Billogram.client }

  describe "error handling" do
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
