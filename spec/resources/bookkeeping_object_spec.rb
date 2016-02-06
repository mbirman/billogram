require 'spec_helper'

describe Billogram::BookkeepingObject do
  subject { described_class.new(fixture("bookkeeping_object")) }

  it { is_expected.to respond_to(:dimension_id) }
  it { is_expected.to respond_to(:object_id) }
  it { is_expected.to respond_to(:dimension_name) }
  it { is_expected.to respond_to(:object_name) }
end
