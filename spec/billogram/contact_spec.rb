# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Contact do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:phone) }
end
