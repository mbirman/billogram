module Billogram
  class Tax < Resource
    attr_accessor :is_vat_registered, :has_fskatt, :vat_no
  end
end
