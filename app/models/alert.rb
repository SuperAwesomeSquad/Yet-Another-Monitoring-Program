class Alert < ActiveRecord::Base
  attr_accessible :active, :ping_id, :user_id
  belongs_to :ping
  belongs_to :user
end
