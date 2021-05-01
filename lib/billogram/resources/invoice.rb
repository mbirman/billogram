# frozen_string_literal: true

module Billogram
  class Invoice < Resource
    include Endpoint

    endpoint 'billogram'

    attr_accessor :attachment, :attested_at, :automatic_reminders, :created_at,
                  :creditor_unique_value, :currency, :delivery_method, :detailed_sums,
                  :due_date, :due_days, :flags, :id, :interest_fee, :interest_rate,
                  :invoice_date, :invoice_fee, :invoice_fee_vat, :invoice_no,
                  :ocr_number, :offers, :pdf, :recipient_url, :remaining_sum,
                  :reminder_count, :reminder_fee, :respite_date, :rounding_value,
                  :sales_accepted, :show_item_gross_prices, :state, :total_sum,
                  :updated_at, :url

    relation :info, :one
    relation :customer, :one
    relation :regional_sweden, :one
    relation :automatic_collection, :one
    relation :callbacks, :one, class_override: 'Callbacks'
    relation :detailed_sums, :one, class_override: 'DetailedSums'

    relation :items, :many
    relation :events, :many
    relation :automatic_reminders_settings, :many, class_override: 'AutomaticReminder'

    COMMANDS = [
      :sell, :remind, :collect, :writeoff, :resend,
      :remind, :payment, :credit, :message, :attach
    ].freeze

    COMMANDS.each do |command|
      define_method command do |*args|
        send_command(command, *args)
      end
    end

    def send!(method:)
      send_command(:send, { method: method })
    end

    private

    def send_command(command, options = {})
      path = "#{endpoint}/#{id}/command/#{command}"
      self.class.perform_request(:post, path, options)
    end
  end
end
