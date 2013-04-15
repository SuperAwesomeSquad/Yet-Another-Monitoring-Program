class PingMonitor < ActiveRecord::Base
  attr_accessible :hostname
  has_one :BaseMonitor, as: :monitorable
  before_save :create_basemonitor_object
  # after_create :associate_basemonitor_with_user

  def type
  	"Ping Monitor"
  end

  def to_s
  	if self.hostname
  		"Ping Monitor for #{self.hostname}"
  	else
  		"Ping Monitor for Undefined Host"
  	end
  end

  protected
  def create_basemonitor_object
    self.BaseMonitor = BaseMonitor.new unless self.BaseMonitor
  end

  # def associate_basemonitor_with_user
  #   self.BaseMonitor.user = @current_user
  #   @current_user.BaseMonitors << self.BaseMonitor
  # end
end
