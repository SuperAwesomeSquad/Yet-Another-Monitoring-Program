module MonitorTemplate

  def type
    pretty_class
  end

  def to_s
    if monitored_thing
      "#{pretty_class} for #{monitored_thing}"
    else
      "#{pretty_class} for unknown object"
    end
  end

  def owner
    self.BaseMonitor.user.email
  end

  protected
  def create_basemonitor_object
    self.build_BaseMonitor unless self.BaseMonitor
  end

  def pretty_class
    self.class.to_s.titleize
  end

end
