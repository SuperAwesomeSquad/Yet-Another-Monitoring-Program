class PingMonitor < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :BaseMonitor, as: :monitorable
  def type
  	"Ping Monitor"
  end
end
