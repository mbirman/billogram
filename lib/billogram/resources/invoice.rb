module Billogram
  class Invoice < Resource
    include Endpoint

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
    relation :callbacks, :one, class_override: "Callbacks"
    relation :detailed_sums, :one, class_override: "DetailedSums"

    relation :items, :many
    relation :events, :many

    COMMANDS = [ :sell, :remind, :collect, :writeoff, :resend, :remind, :payment, :credit, :message, :attach ]

    COMMANDS.each do |command|
      define_method command do |*args|
        send_command(command, *args)
      end
    end

    def send!(method: )
      send_command(:send, {method: method})
    end

    private

    def send_command(command, options = {})
      path = "#{endpoint}/#{id}/command/#{command}"
      self.class.perform_request(:post, path, options)
    end
  end
end
