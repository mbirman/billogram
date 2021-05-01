# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Event do
  subject { described_class.new(fixture('event')) }

  it_behaves_like 'resource with endpoint', 'billogram_event'

  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:type) }

  it { is_expected.to have_relation(:data, Billogram::Data) }
end
