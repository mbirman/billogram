module Billogram
  class Resource
    attr_reader :data

    DEFAULT_OPTIONS = { page: 1, page_size: 2 }

    class << self
      def relations
        @relations ||= { one: Set.new, many: Set.new }
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

      def fetch(id)
        response = Billogram.client.get("#{endpoint}/#{id}")
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

      def relation(relation_name, relation_type = :one)
        relations[relation_type] << relation_name
        attr_accessor relation_name
      end
    end

    def initialize(attributes = {})
      Hash(attributes).each do |key, value|
        public_send("#{key}=", value) if respond_to?(key)
      end

      RelationBuilder.new(self, attributes).call
    end
  end
end
