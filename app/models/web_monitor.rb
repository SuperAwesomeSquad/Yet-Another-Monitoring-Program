class WebMonitor < ActiveRecord::Base
  attr_accessible :url
  has_one :BaseMonitor, as: :monitorable
  has_many :WebResults
  before_save :create_basemonitor_object

  include MonitorTemplate

  def type
    "Web Monitor"
  end

  def to_s
    if self.url
      "Web Monitor for #{self.url}"
    else
      "Web Monitor for Undefined Host"
    end
  end

  def do
    WebWorker.perform_async(self.id)
  end

end
