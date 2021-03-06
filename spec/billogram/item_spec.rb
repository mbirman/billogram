# frozen_string_literal: true

require 'spec_helper'

describe Billogram::Item do
  subject { build(described_class) }

  it_behaves_like 'resource with endpoint', 'item'

  it { is_expected.to respond_to(:item_no) }
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:price) }
  it { is_expected.to respond_to(:count) }
  it { is_expected.to respond_to(:discount) }
  it { is_expected.to respond_to(:vat) }
  it { is_expected.to respond_to(:unit) }
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }

  it { is_expected.to have_relation(:bookkeeping, Billogram::Bookkeeping) }
  it { is_expected.to have_relation(:regional_sweden, Billogram::RegionalSweden) }

  it { is_expected.to alias_id(:item_no) }
end
