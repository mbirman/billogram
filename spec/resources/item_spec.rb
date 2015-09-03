require 'spec_helper'

describe Billogram::Item do
  subject { described_class }

  its(:endpoint) { is_expected.to eq('item') }
end
