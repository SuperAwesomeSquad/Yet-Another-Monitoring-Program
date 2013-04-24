class BaseMonitor < ActiveRecord::Base
  attr_accessible :name, :frequency, :active
  belongs_to :monitorable, polymorphic: true
  delegate :type, :do, :to_s, to: :monitorable
  belongs_to :user

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
