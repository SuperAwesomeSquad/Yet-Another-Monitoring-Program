class BaseMonitor < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :monitorable, polymorphic: true
  delegate :type, to: :monitorable
  belongs_to :user
  def monitor?
  	true
  end
end
