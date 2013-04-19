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

  def frequency=(minutes)
    self.BaseMonitor.update_attribute(:frequency_in_seconds, minutes * 60)
  end

  def frequency
    self.BaseMonitor.frequency_in_seconds / 60
  end

  protected
  def create_basemonitor_object
    # self.BaseMonitor = BaseMonitor.new unless self.BaseMonitor
  end

  def pretty_class
    self.class.to_s.titleize
  end

  # def associate_basemonitor_with_user
  #   self.BaseMonitor.user = @current_user
  #   @current_user.BaseMonitors << self.BaseMonitor
  # end
end
