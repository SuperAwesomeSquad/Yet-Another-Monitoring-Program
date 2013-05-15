class WebMonitor < ActiveRecord::Base
  attr_accessible :url, :BaseMonitor_attributes
  has_many :WebResults
  has_one :base_monitors, as: :monitorable

  accepts_nested_attributes_for :base_monitors

  include MonitorTemplate

  def monitored_thing
    self.url
  end

  def do
    WebWorker.perform_async(self.id)
  end

end
