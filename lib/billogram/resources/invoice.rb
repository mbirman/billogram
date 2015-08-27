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

    def sell
      perform_request("#{endpoint}/#{id}/command/send", :post)
    end

    def collect
      perform_request("#{endpoint}/#{id}/command/collect", :post)
    end

    def writeoff(options = {})
      perform_request("#{endpoint}/#{id}/command/writeoff", :post)
    end

    def send!(options = {})
      # https://billogram.com/api/documentation#billogram_call_send
      perform_request("#{endpoint}/#{id}/command/send", :post, options)
    end

    def resend(options = {})
      perform_request("#{endpoint}/#{id}/command/resend", :post, options)
    end

    def remind(options = {})
      perform_request("#{endpoint}/#{id}/command/remind", :post, options)
    end

    def payment(options = {})
      perform_request("#{endpoint}/#{id}/command/payment", :post, options)
    end

    def credit(options = {})
      perform_request("#{endpoint}/#{id}/command/credit", :post, options)
    end

    def message(options = {})
      perform_request("#{endpoint}/#{id}/command/message", :post, options)
    end

    def attach(options = {})
      perform_request("#{endpoint}/#{id}/command/attach", :post, options)
    end
  end
end
