# frozen_string_literal: true

module Billogram
  class Address < Resource
    attr_accessor :attention, :careof, :city, :country, :email, :name,
                  :street_address, :use_careof_as_attention, :zipcode
  end
end
