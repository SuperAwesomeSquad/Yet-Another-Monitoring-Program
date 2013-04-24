class PingResult < ActiveRecord::Base
  attr_accessible :duration, :successful
  belongs_to :PingMonitor

  def successful?
    successful
  end

end
