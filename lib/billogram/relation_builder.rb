# frozen_string_literal: true

module Billogram
  class RelationBuilder
    attr_reader :resource, :attributes

    def initialize(resource, attributes)
      @resource = resource
      @attributes = attributes
    end

    def call
      resource_relations.each do |relation|
        build_relation(relation)
      end
    end

    private

    def resource_relations
      resource.class.relations
    end

    def build_relation(relation)
      attrs = attributes.delete(relation.name)

      return unless attrs

      value = relation.relation_class.build_objects(attrs)
      resource.public_send("#{relation.name}=", value)
    end
  end
end
