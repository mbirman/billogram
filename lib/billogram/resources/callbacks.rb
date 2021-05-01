# frozen_string_literal: true

module Billogram
  class Callbacks < Resource
    attr_accessor :callback_id, :callback_timestamp, :callback_type, :custom,
                  :sandbox, :sign_key, :signature, :url

    relation :event, :one
    relation :billogram, :one, class_override: 'Invoice'
  end
end
