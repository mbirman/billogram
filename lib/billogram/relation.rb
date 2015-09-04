module Billogram
  class Relation
    attr_reader :name, :type, :class_override

    def initialize(name, type, class_override: nil)
      @name = name
      @type = type
      @class_override = class_override
    end

    def relation_class
      "Billogram::#{class_override || class_name}".constantize
    end

    def class_name
      @class_name ||= send("class_name_for_#{type}").classify
    end

    def class_name_for_one
      name.to_s
    end

    def class_name_for_many
      name.to_s.singularize
    end
  end
end
