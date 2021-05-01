# frozen_string_literal: true

module Billogram
  class DetailedSums < Resource
    attr_accessor :credited_sum, :net_sum, :gross_sum, :invoice_fee_vat, :paid_sum,
      :interest_fee, :vat_sum, :reminder_fee, :invoice_fee, :rounding, :collector_paid_sum,
      :remaining_sum

    relation :regional_sweden, :one
  end
end
