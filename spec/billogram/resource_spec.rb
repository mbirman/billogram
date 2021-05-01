# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Resource do
  describe '.build_objects' do
    subject(:built_objects) { described_class.build_objects(argument) }

    before { allow_any_instance_of(described_class).to receive('attribute=') }

    describe 'when hash given' do
      let(:argument) { { attribute: 'test' } }

      it { is_expected.to be_a(described_class) }
    end

    describe 'when array given' do
      let(:argument) { [{ attribute: 'test' }, { attribute: 'test2' }] }

      it { is_expected.to be_a(Array) }

      it 'returns array of instances' do
        expect(built_objects).to all(be_a(described_class))
      end
    end

    describe 'when nil given' do
      let(:argument) { nil }

      it { is_expected.to be_nil }
    end

    describe 'when string given' do
      let(:argument) { 'test' }

      it { is_expected.to eq('test') }
    end
  end

  describe '.relation' do
    before do
      described_class.relation(:one_relation, :one)
      described_class.relation(:many_relations, :many)
    end

    it 'defines attr_accessors' do
      expect(described_class.new).to respond_to(:one_relation)
      expect(described_class.new).to respond_to(:many_relations)
    end

    it 'adds relation to class variable' do
      expect(described_class.relations).to include(Billogram::Relation)
    end
  end

  describe '#to_hash' do
    subject(:resource) { described_class.new }

    let(:array) { [described_class.new, described_class.new] }
    let(:mocked_resource) { described_class.new }
    let(:instance_variables) { [:@array, :@resource] }

    before do
      allow(resource).to receive(:instance_variables).and_return(instance_variables)
      allow(resource).to receive(:instance_variable_get).with(:@array).and_return(array)
      allow(resource).to receive(:instance_variable_get).with(:@resource).and_return(mocked_resource)
    end

    it 'calls #to_hash on a nested resource' do
      expect(mocked_resource).to receive(:to_hash)

      resource.to_hash
    end

    it 'calls #to_hash on every item in array' do
      expect(array).to all(receive(:to_hash))

      resource.to_hash
    end
  end

  describe 'unknown attribute' do
    it 'shows warning' do
      expect { described_class.new(key: 'test') }
        .to output("Billogram::Resource: unknown attribute key\n").to_stderr
    end
  end
end
