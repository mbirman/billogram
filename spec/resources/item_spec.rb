# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Item do
  it_behaves_like :resource_with_endpoint, 'item'

  describe 'initialization' do
    subject { described_class.new(fixture('item')) }

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

    it 'has id' do
      expect(subject.id).to eq(subject.item_no) 
    end

    it 'has relations' do
      expect(subject.bookkeeping).to be_a(Billogram::Bookkeeping)
    end
  end

  describe '#delete' do
    it 'deletes item' do
      allow(Billogram.client).to receive(:delete) { double(success?: true, :[] => []) }

      expect(Billogram.client).to receive(:delete).with('/item/1', {})

      described_class.new(item_no: 1).delete
    end
  end
end
