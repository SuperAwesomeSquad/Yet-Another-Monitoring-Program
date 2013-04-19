class BaseMonitor < ActiveRecord::Base
  attr_accessible :user_id, :name, :monitorable_type, :monitorable, :frequency
  belongs_to :monitorable, polymorphic: true
  delegate :type, :do, :to_s, to: :monitorable
  belongs_to :user

  validates :monitorable, presence: true
  validates :monitorable_type, presence: true

  def monitor?
  	true
  end

  def frequency=(minutes)
    update_attribute(:frequency_in_seconds, minutes*60)
  end

  def frequency
    frequency_in_seconds * 60
  end

end
