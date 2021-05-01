# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Callbacks do
  it { is_expected.to respond_to(:callback_id) }
  it { is_expected.to respond_to(:custom) }
  it { is_expected.to respond_to(:signature) }
  it { is_expected.to respond_to(:sandbox) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:sign_key) }
end
