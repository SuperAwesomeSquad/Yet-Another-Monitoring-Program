class Ping < ActiveRecord::Base
  attr_accessible :frequency_in_seconds, :hostname
end
