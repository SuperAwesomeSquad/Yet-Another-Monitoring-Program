class WebResult < ActiveRecord::Base
  attr_accessible :duration, :status_code, :successful, :exception
  belongs_to :web_monitor

  def successful?
    successful
  end

end
