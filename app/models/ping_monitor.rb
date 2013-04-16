class PingMonitor < ActiveRecord::Base
  has_one :BaseMonitor, as: :monitorable
  has_many :PingResults
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

  def do
    PingWorker.perform_async(self.id)
  end

end
