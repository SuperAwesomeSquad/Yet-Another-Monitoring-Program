class PingMonitor < ActiveRecord::Base
  has_one :BaseMonitor, as: :monitorable
  before_save :create_basemonitor_object

  attr_accessible :hostname

  include MonitorTemplate

  def type
  	"Ping Monitor"
  end

  def to_s
  	if self.hostname
  		"Ping Monitor for #{self.hostname}"
  	else
  		"Ping Monitor for Undefined Host"
  	end
  end
end
