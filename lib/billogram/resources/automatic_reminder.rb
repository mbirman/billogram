# frozen_string_literal: true

module Billogram
  class AutomaticReminder < Resource
    attr_accessor :message, :delay_days
  end
end
