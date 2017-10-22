module Billogram
  class RegionalSweden < Resource
    attr_accessor :autogiro_betalarnummer, :autogiro_full_status, :autogiro_payment_date,
      :autogiro_status, :autogiro_total_sum, :efaktura_recipient_bank_code,
      :efaktura_recipient_bank_id, :efaktura_recipient_bank_name,
      :efaktura_recipient_id_number, :efaktura_recipient_identifier,
      :efaktura_recipient_type, :efaktura_requested_amount, :reversed_vat,
      :rotavdrag, :rotavdrag_account, :rotavdrag_description,
      :rotavdrag_personal_number, :rotavdrag_sum, :rotavdrag_housing_association_org_no,
      :rotavdrag_apartment_designation, :rotavdrag_description_of_property

      relation :electricity_collection, :one
  end
end
