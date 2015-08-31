module Billogram
  class Customer < Resource
    endpoint 'customer'

    attr_accessor :customer_no, :name, :notes, :org_no, :vat_no, :created_at, :updated_at, :company_type

    relation :address, :one
    relation :contact, :one
    relation :delivery_address, :one
  end
end
