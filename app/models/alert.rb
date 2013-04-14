class Alert < ActiveRecord::Base
  attr_accessible :active, :ping_id, :user_id
  belongs_to :ping
  belongs_to :user
  def to_s
  	"Alert for #{self.ping.to_s} owned by #{self.user.to_s}"
  end
end
