module Billogram
  class Logotype < Resource
    attr_accessor :content, :file_type

    def self.upload(*args)
      create(*args)
    end
  end
end
