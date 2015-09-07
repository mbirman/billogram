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

    def extract_attributes(relation)
      attributes.delete(relation.name)
    end

    def resource_relations
      resource.class.relations
    end

    def build_relation(relation)
      if attrs = extract_attributes(relation)
        value = relation.relation_class.build_objects(attrs)
        resource.public_send("#{relation.name}=", value)
      end
    end
  end
end
