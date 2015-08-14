module Billogram
  class Customer < Resource
    relation :address, :single
    relation :delivery_address, :single
    relation :contact, :single
  end
end
