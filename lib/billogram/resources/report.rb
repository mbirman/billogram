module Billogram
  class Report < Resource
    attr_accessor :filename, :type, :file_type, :info, :created_at, :content

    alias_method :id, :filename
  end
end
