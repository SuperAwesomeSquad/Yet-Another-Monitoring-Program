class WebMonitor < ActiveRecord::Base
  attr_accessible :url
  before_save :create_basemonitor_object
  has_many :WebResults
  has_one :BaseMonitor, as: :monitorable

  accepts_nested_attributes_for :BaseMonitor

  include MonitorTemplate

  def monitored_thing
    self.url
  end

  def do
    WebWorker.perform_async(self.id)
  end

end
