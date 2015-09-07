module Billogram
  class Logotype < Resource
    include Endpoint

    attr_accessor :content, :file_type

    def self.upload(*args)
      create(*args)
    end
  end
end
