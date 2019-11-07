module Billogram
  class Event < Resource
    include Endpoint

    endpoint 'billogram_event'

    attr_accessor :created_at, :type, :event_uuid

    relation :data, :one, class_override: "Data"
  end
end
