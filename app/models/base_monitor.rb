class BaseMonitor < ActiveRecord::Base
  attr_accessible :name, :frequency, :active, :file_monitor_attributes, :web_monitor_attributes
  belongs_to :monitorable, polymorphic: true
  delegate :type, :do, :to_s, to: :monitorable
  belongs_to :user

# accepts_nested_attributes_for :file_monitor, :web_monitor

  def active?
    active
  end

  def frequency=(minutes)
    update_attribute(:frequency_in_seconds, minutes*60)
  end

  def frequency
    frequency_in_seconds / 60
  end

end
