require 'spec_helper'

describe Billogram::Contact do
  subject { described_class.new }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:phone) }
end
