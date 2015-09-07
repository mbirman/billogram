module Billogram
  class Item < Resource
    include Endpoint

    attr_accessor :item_no, :title, :description, :price, :vat, :unit,
      :created_at, :updated_at, :count, :discount

    alias_method :id, :item_no

    relation :bookkeeping, :one
    relation :regional_sweden, :one
  end
end
