module Billogram
  class Callback < Resource
    relation :invoice
    relation :event
  end
end
