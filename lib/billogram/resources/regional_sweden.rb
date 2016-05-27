module Billogram
  class RegionalSweden < Resource
    attr_accessor :rotavdrag, :rotavdrag_personal_number, :rotavdrag_description,
      :reversed_vat, :rotavdrag_account, :rotavdrag_sum, :autogiro_payment_date,
      :autogiro_status, :autogiro_full_status, :autogiro_betalarnummer,
      :autogiro_total_sum
  end
end
