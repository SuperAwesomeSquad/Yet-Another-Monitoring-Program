class PingMonitor < ActiveRecord::Base
  attr_accessible :hostname, :BaseMonitor_attributes
  before_save :create_basemonitor_object
  has_many :PingResults
  has_one :base_monitor, as: :monitorable

  accepts_nested_attributes_for :base_monitor


include MonitorTemplate


def monitored_thing
  self.hostname
end

def do
   PingWorker.perform_async(self.id)
end

end
class PingMonitor < ActiveRecord::Base
  attr_accessible :hostname, :BaseMonitor_attributes
  has_many :PingResults
  has_one :BaseMonitor, as: :monitorable
  validates_presence_of :name

  accepts_nested_attributes_for :BaseMonitor

  include MonitorTemplate

  def monitored_thing
    self.hostname
  end

  def do
    PingWorker.perform_async(self.id)
  end

end
