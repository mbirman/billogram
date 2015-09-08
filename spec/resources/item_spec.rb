require 'spec_helper'

describe Billogram::Item do
  it_behaves_like "a resource with endpoint", "item"

  describe "initialization" do
    subject { described_class.new(fixture("item")) }

    it { is_expected.to respond_to(:item_no) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:price) }
    it { is_expected.to respond_to(:count) }
    it { is_expected.to respond_to(:discount) }
    it { is_expected.to respond_to(:vat) }
    it { is_expected.to respond_to(:unit) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }

    its(:id) { is_expected.to eq(subject.item_no) }

    describe "relations" do
      its(:bookkeeping) { is_expected.to be_a(Billogram::Bookkeeping) }
    end
  end


  describe "#delete" do
    subject { described_class.new(item_no: 1) }

    before do
      response = OpenStruct.new(success?: true)
      allow(Billogram.client).to receive(:delete).and_return(response)
    end

    it "deletes item" do
      expect(Billogram.client).to receive(:delete).with("item/1", {})
      subject.delete
    end
  end
end
