module Billogram
  class Settings < Resource
    include Endpoint

    attr_accessor :name, :org_no

    relation :tax,          :one
    relation :contact,      :one
    relation :address,      :one
    relation :payment,      :one
    relation :invoices,     :one, class_override: 'InvoiceDefaults'
    relation :bookkeeping,  :one
  end
end
