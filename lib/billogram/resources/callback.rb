module Billogram
  class Callback < Resource
    attr_accessor :callback_id, :custom, :signature, :sandbox

    relation :event, :one
    relation :invoice, :one
  end
end
