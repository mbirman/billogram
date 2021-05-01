# frozen_string_literal: true

module Billogram
  class Edi < Resource
    attr_accessor :electronic_id, :operator, :subtype, :reference, :note
  end
end
