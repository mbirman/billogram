# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Address do
  it { is_expected.to respond_to(:street_address) }
  it { is_expected.to respond_to(:careof) }
  it { is_expected.to respond_to(:zipcode) }
  it { is_expected.to respond_to(:city) }
  it { is_expected.to respond_to(:country) }
  it { is_expected.to respond_to(:attention) }
end
