module Billogram
  class Settings < Resource
    include Endpoint

    attr_accessor :name, :org_no

    relation :contact, :one
    relation :address, :one
    relation :payment, :one
    relation :tax, :one
    relation :bookkeeping, :one
    relation :invoices, :one, class_override: "InvoiceDefaults"
  end
end
