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
      Object.const_get("Billogram::#{relation_name.to_s.split('_').map(&:capitalize).join()}")
    end

    def relation_attributes(relation_name)
      attributes.delete(relation_name.to_s)
    end

    def resource_relations
      resource.class.relations
    end

    def build_relation(type, relation_names)
      relation_names.each do |name|
        if type == :one
          build_one_relation(name)
        elsif type == :many
          build_many_relation(name)
        end
      end
    end

    def build_one_relation(name)
      if attrs = relation_attributes(name)
        value = relation_class(name).new attrs
        resource.instance_variable_set("@#{name}", value)
      end
    end

    def build_many_relation(name)
      if attrs = relation_attributes(name)
        singular = name[0..name.length-2]
        value = attrs.map{|item| relation_class(singular).new(item) }
        resource.instance_variable_set("@#{name}", value)
      end
    end
  end
end
