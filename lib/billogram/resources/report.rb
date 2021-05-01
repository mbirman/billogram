# frozen_string_literal: true

module Billogram
  class Report < Resource
    include Endpoint

    attr_accessor :filename, :type, :file_type, :info, :created_at, :content

    alias id filename
  end
end
