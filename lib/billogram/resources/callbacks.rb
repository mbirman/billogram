module Billogram
  class Callbacks < Resource
    attr_accessor :callback_id, :custom, :signature, :sandbox, :url, :sign_key

    relation :event, :one
    relation :invoice, :one
  end
end
