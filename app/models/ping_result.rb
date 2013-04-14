class PingResult < ActiveRecord::Base
  attr_accessible :duration, :exception, :ping_id, :successful
  belongs_to :ping
end
