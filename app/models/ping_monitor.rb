class PingMonitor < ActiveRecord::Base
  attr_accessible :hostname
  has_one :BaseMonitor, as: :monitorable
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
