module Billogram
  class Resource
    attr_reader :data

    class << self
      def endpoint(value = nil)
        @endpoint = value if value
        @endpoint || name.demodulize.underscore.pluralize
      end

      def search(options = {})
        response = Billogram.client.get("#{endpoint}", {query: options})
        parse_response(response.parsed_response["data"])
      end

      def parse_response(data)
        # TODO: refactor
        case data
        when Hash then new(data)
        when Array then data.map{|item| parse_response({'data' => item}) }
        when nil
        else data
        end
      end
    end

    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end
  end
end
