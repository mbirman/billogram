# frozen_string_literal: true

require 'spec_helper'

class House < Billogram::Resource
  relation :basement, :one
  relation :bedrooms, :many
end

describe Billogram::Resource do
  subject(:resource) { House.new(bedrooms: [bedroom_1, bedroom_2], basement: basement) }

  let(:basement) { { 'basement' => SecureRandom.hex } }
  let(:bedroom_1) { { 'bedroom_1' => SecureRandom.hex } }
  let(:bedroom_2) { { 'bedroom_2' => SecureRandom.hex } }

  describe '.build_objects' do
    describe 'when hash given' do
      subject { House.build_objects({ basement: basement }) }

      it { is_expected.to be_a(described_class) }
    end

    describe 'when array given' do
      subject(:built_objects) do
        House.build_objects([{ basement: basement }, { basement: basement }])
      end

      it 'returns array of instances' do
        expect(built_objects).to all(be_a(described_class))
      end
    end

    describe 'when nil given' do
      subject { House.build_objects(nil) }

      it { is_expected.to be_nil }
    end

    describe 'when string given' do
      subject { House.build_objects('test') }

      it { is_expected.to eq('test') }
    end
  end

  describe '.relation' do
    it { is_expected.to respond_to(:basement) }
    it { is_expected.to respond_to(:bedrooms) }

    it 'caches the relation' do
      expect(House.relations.size).to eq(2)
    end
  end

  describe '#to_hash' do
    it 'serializes nested resources' do
      expect(resource.to_hash['basement']).to eq(basement)
    end

    it 'serializes array attributes' do
      expect(resource.to_hash['bedrooms']).to eq([bedroom_1, bedroom_2])
    end
  end

  describe 'unknown attribute' do
    it 'shows warning' do
      expect { House.new(key: 'test') }
        .to output("#{resource.class.name}: unknown attribute key\n").to_stderr
    end
  end
end
