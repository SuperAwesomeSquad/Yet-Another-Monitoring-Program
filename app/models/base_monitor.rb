class BaseMonitor < ActiveRecord::Base
  attr_accessible :name, :frequency, :active, :frequency_in_seconds
  belongs_to :monitorable, polymorphic: true
  delegate :do, to: :monitorable
  belongs_to :user


  def active?
    active
  end

  def name

  end

  def frequency=(minutes)
    update_attribute(:frequency_in_seconds, minutes*60)
  end

  def frequency
    frequency_in_seconds / 60
  end

end
