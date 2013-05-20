class PingMonitor < ActiveRecord::Base
  attr_accessible :hostname, :BaseMonitor_attributes
  has_many :PingResults
  has_one :BaseMonitor, as: :monitorable
  # validates_presence_of :hostname

  # accepts_nested_attributes_for :BaseMonitor


  include MonitorTemplate


  def monitored_thing
    self.hostname
  end

  def do
   PingWorker.perform_async(self.id)
 end

end

