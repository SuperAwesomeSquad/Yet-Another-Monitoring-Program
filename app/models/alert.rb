class Alert < ActiveRecord::Base
  attr_accessible :active, :base_monitor_id, :alert_end, :resolution, :alert_start, :last_check
  belongs_to :base_monitor
  has_one :user, :through => :base_monitor

  def duration
    if active?
      Time.current - created_at
    else
      alert_end - created_at
    end
  end

  def active?
    active
  end

  def resolve(method=:automated)
    update_attribute(:resolution, method)
    update_attribute(:active, false)
    update_attribute(:alert_end, Time.now)
  end

end
