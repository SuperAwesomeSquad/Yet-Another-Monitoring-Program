class BaseMonitor < ActiveRecord::Base
  attr_accessible :user_id, :name, :monitorable_type, :monitorable
  belongs_to :monitorable, polymorphic: true
  delegate :type, :do, :to_s, to: :monitorable
  belongs_to :user

  validates :monitorable, presence: true
  validates :monitorable_type, presence: true

  def monitor?
  	true
  end
end
