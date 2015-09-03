require 'spec_helper'

describe Billogram::Tax do
  subject { described_class.new }

  it { is_expected.to respond_to(:is_vat_registered) }
  it { is_expected.to respond_to(:has_fskatt) }
  it { is_expected.to respond_to(:vat_no) }
end
