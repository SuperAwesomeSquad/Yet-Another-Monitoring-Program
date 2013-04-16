class WebResult < ActiveRecord::Base
  attr_accessible :duration, :status_code, :successful
  belongs_to :WebMonitor

  def alert?
    !successful
  end
end
