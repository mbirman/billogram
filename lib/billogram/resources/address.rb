module Billogram
  class Address < Resource
    attr_accessor :street_address, :careof, :use_careof_as_attention, :zipcode,
      :city, :country, :name, :attention
  end
end
