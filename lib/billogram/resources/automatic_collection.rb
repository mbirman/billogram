module Billogram
  class AutomaticCollection < Resource
    attr_accessor :delay_days, :amount, :use_default_settings
  end
end
