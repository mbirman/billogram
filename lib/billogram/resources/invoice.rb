module Billogram
  class Invoice < Resource
    endpoint 'billogram'

    attr_accessor :id, :invoice_no, :ocr_number, :invoice_date, :due_date, :due_days, 
                  :invoice_fee, :invoice_fee_vat, :reminder_fee, :interest_rate,
                  :interest_fee, :currency, :delivery_method, :state, :url, :flags,
                  :remaining_sum, :total_sum, :rounding_value, :automatic_reminders,
                  :reminder_count, :created_at, :attested_at, :updated_at, :detailed_sums,
                  :attachment

    relation :info, :one
    relation :customer, :one
    relation :regional_sweden, :one

    relation :items, :many
    relation :events, :many
  end
end
