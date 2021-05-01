# frozen_string_literal: true

module Billogram
  class Item < Resource
    include Endpoint

    attr_accessor :item_no, :title, :description, :price, :vat, :unit,
                  :created_at, :updated_at, :count, :discount

    alias id item_no

    relation :bookkeeping, :one
    relation :regional_sweden, :one

    def delete
      self.class.perform_request(:delete, "#{endpoint}/#{id}")
    end
  end
end
