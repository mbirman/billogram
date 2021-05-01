# frozen_string_literal: true

module Billogram
  class Relation
    attr_reader :name, :type, :class_override

    def initialize(name, type, class_override: nil)
      @name = name.to_s
      @type = type
      @class_override = class_override
    end

    def relation_class
      "Billogram::#{class_override || name.classify}".constantize
    end
  end
end
