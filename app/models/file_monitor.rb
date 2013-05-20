class FileMonitor < ActiveRecord::Base
  attr_accessible :BaseMonitor_attributes
  before_save :create_basemonitor_object
  has_one :BaseMonitor, as: :monitorable

  # accepts_nested_attributes_for :BaseMonitor

  include MonitorTemplate

  def monitored_thing
    "Nothing"
  end

  def to_s
    "#{pretty_class}"
  end


end
