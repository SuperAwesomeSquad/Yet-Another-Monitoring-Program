class Ping < ActiveRecord::Base
  attr_accessible :frequency_in_seconds, :hostname
  has_many :PingResults
  def to_s
  	self.hostname
  end
end