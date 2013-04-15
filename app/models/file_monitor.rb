class FileMonitor < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :BaseMonitor, as: :monitorable
  def type
  	"File Monitor"
  end
end
