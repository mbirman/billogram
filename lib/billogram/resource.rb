module Billogram
  class Resource
    attr_reader :data

    DEFAULT_OPTIONS = { page: 1, page_size: 2 }

    class << self
      def relations
        @relations ||= {}
      end

      def endpoint(value = nil)
        @endpoint = value if value
        @endpoint || name.demodulize.underscore.pluralize
      end

      def search(options = {})
        query = DEFAULT_OPTIONS.merge(options)
        response = Billogram.client.get("#{endpoint}", {query: query})
        parse_response(response.parsed_response["data"])
      end

      def parse_response(data)
        # TODO: refactor, error handling
        case data
        when Hash then new(data)
        when Array then data.map{|item| parse_response(item) }
        when nil
        else data
        end
      end

      def relation(relation_name, relation_type = :single)
        relations[relation_name] = relation_type
      end
    end

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
      build_relations
    end

    def build_relations
      self.class.relations.each do |name, type|
        if relation_attrs = attributes.delete(name.to_s)
          value = relation_class(name).new(relation_attrs)
          instance_variable_set("@#{name}", value)
        end
      end
    end

    def relation_class(relation_name)
      Object.const_get("Billogram::#{relation_name.capitalize}")
    end
  end
end
