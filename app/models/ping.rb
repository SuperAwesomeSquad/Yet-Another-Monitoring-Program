class Ping < ActiveRecord::Base
  attr_accessible :user_id, :frequency_in_seconds, :hostname
  has_many :PingResults
  has_many :alerts
  belongs_to :user
  def to_s
  	self.hostname
  end

  def do
  	PingWorker.perform_async(self.id)
  end
end
