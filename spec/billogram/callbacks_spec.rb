# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Callbacks do
  subject { build(described_class) }

  it { is_expected.to respond_to(:callback_id) }
  it { is_expected.to respond_to(:custom) }
  it { is_expected.to respond_to(:signature) }
  it { is_expected.to respond_to(:sandbox) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:billogram) }
  it { is_expected.to respond_to(:callback_timestamp) }
  it { is_expected.to respond_to(:callback_type) }

  it { is_expected.to have_relation(:event, Billogram::Event) }
  it { is_expected.to have_relation(:billogram, Billogram::Invoice) }
end
