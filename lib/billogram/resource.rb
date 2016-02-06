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
        if respond_to?("#{key}=")
          public_send("#{key}=", value)
        else
          warn("#{self.class}: unknown attribute #{key}")
        end
      end

      RelationBuilder.new(self, attributes).call
    end

    def to_json(*args)
      to_hash.to_json(*args)
    end

    def to_hash
      instance_variables
        .each_with_object({}) do |variable, obj|
          value = instance_variable_get(variable)

          case value
          when Resource
            value = value.to_hash
          when Array
            value = value.map(&:to_hash)
          end

          obj[variable[1..-1]] = value
        end
    end
  end
end
