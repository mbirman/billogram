module Billogram
  class Data < Resource
    attr_accessor :invoice_no, :delivery_method, :letter_id, :amount, :payer_name,
                  :banking_amount, :manual, :reminder_fee, :reminder_count, :interest_rate,
                  :customer_email, :ip, :type, :message, :collector_method, :collector_reference,
                  :factoring_method, :factoring_reference, :sells_for, :sold_for,
                  :total_sum, :remaining_sum, :scanning_central
  end
end
