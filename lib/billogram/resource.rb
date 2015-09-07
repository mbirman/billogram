require "active_support/core_ext/string/inflections.rb"

module Billogram
  class Resource
    class << self
      def relations
        @relations ||= []
      end

      def relation(name, type, class_override: nil)
        relations << Relation.new(name, type, class_override: class_override)
        attr_accessor name
      end

      def build_objects(data)
        case data
        when Hash then new(data)
        when Array then data.map{|item| build_objects(item) }
        else data
        end
      end
    end

    def initialize(attributes = {})
      Hash(attributes).each do |key, value|
        public_send("#{key}=", value)
      end

      RelationBuilder.new(self, attributes).call
    end

    def to_json(*args)
      instance_variables
        .map{|var| ["#{var}"[1..-1], instance_variable_get(var)]}
        .to_h
        .to_json(*args)
    end
  end
end
