module Billogram
  class Invoice < Resource
    endpoint 'billogram'

    relation :customer, :single
    relation :regional_sweden, :single
    relation :info, :single

    relation :items, :many
    relation :events, :many
    relation :callbacks, :many
  end
end
