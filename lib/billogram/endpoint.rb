# frozen_string_literal: true

module Billogram
  module Endpoint
    def self.included(base)
      base.include(InstanceMethods)
      base.extend(ClassMethods)
    end

    module InstanceMethods
      def update(attributes)
        self.class.perform_request(:put, "#{endpoint}/#{id}", attributes)
      end

      def endpoint
        self.class.endpoint
      end
    end

    module ClassMethods
      attr_writer :default_search_options
      
      def default_search_options
        @default_search_options ||= { page: 1, page_size: 50 }
      end

      def endpoint(value = nil)
        @endpoint = value if value
        @endpoint || name.demodulize.underscore
      end

      def search(options = {})
        query = default_search_options.merge(options)
        perform_request(:get, "#{endpoint}", query)
      end

      def fetch(id = nil)
        perform_request(:get, "#{endpoint}/#{id}")
      end

      def create(attributes)
        perform_request(:post, "#{endpoint}", attributes)
      end

      def perform_request(type, url, params = {})
        response = Request.new(type, url, params).execute
        build_objects(response)
      end
    end
  end
end
