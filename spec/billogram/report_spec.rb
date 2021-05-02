# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Report do
  it_behaves_like 'resource with endpoint', 'report'

  it { is_expected.to respond_to(:filename) }
  it { is_expected.to respond_to(:type) }
  it { is_expected.to respond_to(:file_type) }
  it { is_expected.to respond_to(:info) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:content) }

  it { is_expected.to alias_id(:filename) }
end
