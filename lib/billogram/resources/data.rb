# frozen_string_literal: true

module Billogram
  class Data < Resource
    attr_accessor :amount, :banking_amount, :collector_method,
                  :collector_reference, :customer_email, :delivery_method,
                  :factoring_method, :factoring_reference, :interest_rate,
                  :invoice_no, :ip, :letter_id, :manual, :message, :payer_name,
                  :payment_flags, :remaining_sum, :reminder_count, :reminder_fee,
                  :scanning_central, :sells_for, :sold_for, :total_sum, :type
  end
end
