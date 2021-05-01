# frozen_string_literal: true

module Billogram
  class InvoiceDefaults < Resource
    attr_accessor :default_message, :default_interest_rate, :default_reminder_fee,
                  :default_invoice_fee

    relation :automatic_reminders, :many
    relation :automatic_collection, :many
  end
end
