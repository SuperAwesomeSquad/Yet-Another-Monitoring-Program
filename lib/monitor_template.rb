module MonitorTemplate

  def type
    raise "Sub-class should define this"
  end

  def to_s
    raise "Sub-class should define this"
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
