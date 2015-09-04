module Billogram
  class InternationalBankAccount < Resource
    attr_accessor :bank, :iban, :bic, :swift
  end
end
