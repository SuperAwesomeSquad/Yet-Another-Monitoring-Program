class BaseMonitor < ActiveRecord::Base
  attr_accessible :user_id, :name, :monitorable_type, :monitorable
  belongs_to :monitorable, polymorphic: true
  delegate :type, to: :monitorable
  belongs_to :user
  def monitor?
  	true
  end
end
