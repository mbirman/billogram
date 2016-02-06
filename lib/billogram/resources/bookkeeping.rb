module Billogram
  class Bookkeeping < Resource
    attr_accessor :income_account, :vat_account, :income_account_for_vat_25,
      :income_account_for_vat_12, :income_account_for_vat_6,
      :income_account_for_vat_0, :reversed_vat_account, :vat_account_for_vat_25,
      :vat_account_for_vat_12, :vat_account_for_vat_6, :account_receivable_account,
      :client_funds_account, :banking_account, :interest_fee_account,
      :reminder_fee_account, :rounding_account, :factoring_receivable_account

    relation :regional_sweden, :one
    relation :objects, :many, class_override: "BookkeepingObject"
  end
end
