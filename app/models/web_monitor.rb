class WebMonitor < ActiveRecord::Base
  attr_accessible :duration, :hostname
  has_one :basemonitor, as: :monitorable
  def type
  	"WebMonitor"
  end
end
