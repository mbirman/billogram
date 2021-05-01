# frozen_string_literal: true

module Billogram
  class BookkeepingObject < Resource
    attr_accessor :dimension_id, :object_id, :dimension_name, :object_name
  end
end
