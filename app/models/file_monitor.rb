class FileMonitor < ActiveRecord::Base
  before_save :create_basemonitor_object
  has_many :base_monitors, as: :monitorable

  accepts_nested_attributes_for :base_monitors

  include MonitorTemplate

  def monitored_thing
    "Nothing"
  end

  def to_s
    "#{pretty_class}"
  end


end
