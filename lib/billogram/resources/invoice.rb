module Billogram
  class Invoice < Resource
    endpoint 'billogram'

    DEFAULT_OPTIONS = { page: 1, page_size: 50 }

    def self.search(options = {})
      super(DEFAULT_OPTIONS.merge(options))
    end
  end
end
