# frozen_string_literal: true

module Billogram
  class Payment < Resource
    attr_accessor :bankgiro, :plusgiro

    relation :domestic_bank_account, :one
    relation :international_bank_account, :one
  end
end
