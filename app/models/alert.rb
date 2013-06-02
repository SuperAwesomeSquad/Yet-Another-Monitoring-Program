class Alert < ActiveRecord::Base
  attr_accessible :active, :base_monitor_id, :alert_end, :resolution, :alert_start, :last_check
  belongs_to :base_monitor
  has_one :user, :through => :base_monitor

  def duration
    if active?
      Time.current - alert_start
    else
      alert_end - alert_start
    end
  end

  def active?
    active
  end

  def resolve(method=:automated)
    update_attribute(:resolution, method)
    update_attribute(:active, false)
  end

end
