module Billogram
  class RelationBuilder
    attr_reader :resource, :attributes

    def initialize(resource, attributes)
      @resource = resource
      @attributes = attributes
    end

    def call
      resource_relations.each do |type, relation_names|
        build_relation(type, relation_names)
      end
    end

    private

    def relation_class(relation_name)
      "Billogram::#{relation_name.to_s.classify}".constantize
    end

    def relation_attributes(relation_name)
      attributes.delete(relation_name.to_s)
    end

    def resource_relations
      resource.class.relations
    end

    def build_relation(type, relation_names)
      relation_names.each do |name|
        if attrs = relation_attributes(name)
          if type == :one
            value = relation_class(name).new(attrs)
          elsif type == :many
            singular = name.to_s.singularize
            value = attrs.map{|item| relation_class(singular).new(item) }
          end

          resource.public_send("#{name}=", value)
        end
      end
    end
  end
end
