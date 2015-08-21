module Billogram
  class Resource
    DEFAULT_OPTIONS = { page: 1, page_size: 50 }

    class << self
      def relations
        @relations ||= { one: Set.new, many: Set.new }
      end

      def endpoint(value = nil)
        @endpoint = value if value
        @endpoint || "#{name.sub('Billogram::', '').downcase}s"
      end

      def search(options = {})
        query = DEFAULT_OPTIONS.merge(options)
        response = Billogram.client.get("#{endpoint}", {query: query})
        build_objects(response)
      end

      def fetch(id)
        response = Billogram.client.get("#{endpoint}/#{id}")
        build_objects(response)
      end

      def relation(relation_name, relation_type = :one)
        relations[relation_type] << relation_name
        attr_accessor relation_name
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
        public_send("#{key}=", value) if respond_to?(key)
      end

      RelationBuilder.new(self, attributes).call
    end
  end
end
