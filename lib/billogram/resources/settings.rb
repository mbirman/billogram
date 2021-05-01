# frozen_string_literal: true

module Billogram
  class Settings < Resource
    include Endpoint

    attr_accessor :name, :org_no, :registration_email

    relation :tax,          :one
    relation :contact,      :one
    relation :address,      :one
    relation :payment,      :one
    relation :invoices,     :one, class_override: 'InvoiceDefaults'
    relation :bookkeeping,  :one

    relation :return_address,             :one, class_override: 'Address'
    relation :invoice_address,            :one, class_override: 'Address'
    relation :visiting_address,           :one, class_override: 'Address'
    relation :registered_office_address,  :one, class_override: 'Address'
  end
end
