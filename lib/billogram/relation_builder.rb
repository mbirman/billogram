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
      attributes.delete(relation.name.to_s)
    end

    def resource_relations
      resource.class.relations
    end

    def build_relation(relation)
      if attrs = extract_attributes(relation)
        value = send("build_#{relation.type}", relation, attrs)
        resource.public_send("#{relation.name}=", value)
      end
    end

    def build_one(relation, attrs)
      relation.relation_class.new(attrs)
    end

    def build_many(relation, attrs)
      attrs.map{|item| relation.relation_class.new(item) }
    end
  end
end
