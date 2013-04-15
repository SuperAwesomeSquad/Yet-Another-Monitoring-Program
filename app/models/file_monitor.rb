class FileMonitor < ActiveRecord::Base
  has_one :BaseMonitor, as: :monitorable
  before_save :create_basemonitor_object
  include MonitorTemplate

  def type
  	"File Monitor"
  end

  def to_s
    "A file monitor"
  end


end
