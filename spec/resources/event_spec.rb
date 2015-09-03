require 'spec_helper'

describe Billogram::Event do
  subject { described_class }

  its(:endpoint) { is_expected.to eq('billogram_event') }
end
