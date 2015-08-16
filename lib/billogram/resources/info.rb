module Billogram
  class Info < Resource
    attr_accessor :order_no, :order_date, :our_reference, :your_reference,
                  :shipping_date, :delivery_date, :reference_number, :message
  end
end
