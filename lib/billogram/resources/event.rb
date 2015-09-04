module Billogram
  class Event < Resource
    endpoint 'billogram_event'

    attr_accessor :created_at, :type

    relation :data, :one, class_override: "Data"
  end
end
