# frozen_string_literal: true

module Billogram
  class Bookkeeping < Resource
    attr_accessor :account_receivable_account, :banking_account, :client_funds_account,
                  :debt_collection_funds_account, :expected_loss_account,
                  :factoring_receivable_account, :financial_year_months,
                  :financial_year_start, :income_account, :income_account_for_vat_0,
                  :income_account_for_vat_12, :income_account_for_vat_25,
                  :income_account_for_vat_6, :income_payout_account,
                  :interest_fee_account, :liabilities_customers_account,
                  :non_allocated_account, :reminder_fee_account,
                  :reversed_vat_account, :rounding_account, :sie_continuous_numbering,
                  :sie_serie, :vat_account, :vat_account_for_vat_12,
                  :vat_account_for_vat_25, :vat_account_for_vat_6,
                  :written_down_receivables_account

    relation :regional_sweden, :one
    relation :objects, :many, class_override: 'BookkeepingObject'
  end
end
