module Billogram
  class AutomaticReminder < Resource
    attr_accessor :message, :delay_days
  end
end
