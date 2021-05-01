# frozen_string_literal: true

module Billogram
  class InvoiceDefaults < Resource
    attr_accessor :automatic_reminders_minimum_principal_sum, :automatic_writeoff,
                  :default_interest_rate, :default_invoice_fee, :default_message,
                  :default_reminder_fee, :pdf, :reminders_without_fee, :show_item_gross_prices,
                  :show_new_account_notice, :use_automatic_reminders_partly_paid

    relation :automatic_reminders, :many
    relation :automatic_collection, :many
  end
end
