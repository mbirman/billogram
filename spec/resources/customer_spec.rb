require 'spec_helper'

describe Billogram::Customer do
  subject { described_class.new }

  its(:endpoint) { is_expected.to eq('customer') }
end
