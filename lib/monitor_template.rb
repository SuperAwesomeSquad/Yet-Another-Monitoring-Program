module MonitorTemplate

  protected
  def create_basemonitor_object
    self.build_BaseMonitor unless self.BaseMonitor
  end

end
