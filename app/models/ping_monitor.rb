class PingMonitor < ActiveRecord::Base
  has_one :BaseMonitor, as: :monitorable
  has_many :PingResults
  before_save :create_basemonitor_object

  attr_accessible :hostname

  include MonitorTemplate

  def monitored_thing
    self.hostname
  end

  def do
    PingWorker.perform_async(self.id)
  end

end
