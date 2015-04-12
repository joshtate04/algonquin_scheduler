class Meeting < ActiveRecord::Base
  self.skip_time_zone_conversion_for_attributes = [:end_time, :start_time]

end
