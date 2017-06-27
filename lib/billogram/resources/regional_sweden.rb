module Billogram
  class RegionalSweden < Resource
    attr_accessor :rotavdrag, :rotavdrag_personal_number, :rotavdrag_description,
      :reversed_vat, :rotavdrag_account, :rotavdrag_sum, :autogiro_payment_date,
      :autogiro_status, :autogiro_full_status, :autogiro_betalarnummer,
      :autogiro_total_sum, :autogiro_payment_date, :autogiro_status,
      :autogiro_full_status, :efaktura_recipient_bank_code,
      :efaktura_recipient_bank_id, :efaktura_recipient_type,
      :efaktura_recipient_bank_name, :autogiro_betalarnummer, :autogiro_total_sum,
      :efaktura_recipient_identifier, :efaktura_recipient_id_number

      relation :electricity_collection, :one
  end
end
