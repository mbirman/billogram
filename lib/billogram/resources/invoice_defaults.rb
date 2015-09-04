module Billogram
  class InvoiceDefaults < Resource
    attr_accessor :default_message, :default_interest_rate, :default_reminder_fee,
      :default_invoice_fee, :automatic_reminders
  end
end
