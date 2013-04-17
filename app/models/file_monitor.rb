class FileMonitor < ActiveRecord::Base
  has_one :BaseMonitor, as: :monitorable
  before_save :create_basemonitor_object
  include MonitorTemplate

 def monitored_thing
  "Nothing"
end

  def to_s
    "#{pretty_class}"
  end


end
