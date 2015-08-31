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
    relation :callbacks, :one

    relation :items, :many
    relation :events, :many

    def sell
      perform_request(command_path(:sell), :post)
    end

    def collect
      perform_request(command_path(:collect), :post)
    end

    def writeoff
      perform_request(command_path(:writeoff), :post)
    end

    def send!(method: )
      perform_request(command_path(:send), :post, {method: method})
    end

    def resend(method: )
      perform_request(command_path(:resend), :post, {method: method})
    end

    def remind(method: )
      perform_request(command_path(:remind), :post, {method: method})
    end

    def payment(amount: )
      perform_request(command_path(:payment), :post, {amount: amount})
    end

    def credit(options = {})
      perform_request(command_path(:credit), :post, options)
    end

    def message(message: )
      perform_request(command_path(:message), :post, {message: message})
    end

    def attach(options = {})
      perform_request(command_path(:attach), :post, options)
    end

    private

    def command_path(command)
      "#{endpoint}/#{id}/command/#{command}"
    end
  end
end
