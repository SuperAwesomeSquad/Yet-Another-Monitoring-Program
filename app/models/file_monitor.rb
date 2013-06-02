class FileMonitor < ActiveRecord::Base
  attr_accessible :BaseMonitor_attributes
  before_save :create_basemonitor_object
  has_many :BaseMonitors, as: :monitorable

  accepts_nested_attributes_for :BaseMonitors

  include MonitorTemplate

  def monitored_thing
    "Nothing"
  end

  def to_s
    "#{pretty_class}"
  end

end
