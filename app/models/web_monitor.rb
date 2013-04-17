class WebMonitor < ActiveRecord::Base
  attr_accessible :url
  has_one :BaseMonitor, as: :monitorable
  has_many :WebResults
  before_save :create_basemonitor_object

  include MonitorTemplate

  def monitored_thing
    self.url
  end

  def do
    WebWorker.perform_async(self.id)
  end

end
