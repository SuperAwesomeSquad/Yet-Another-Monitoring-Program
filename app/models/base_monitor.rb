class BaseMonitor < ActiveRecord::Base
  attr_accessible :name, :description, :frequency, :active, :frequency_in_seconds, :monitorable_type, :last_checked, :initial_check
  belongs_to :monitorable, polymorphic: true
  delegate :do, to: :monitorable
  belongs_to :user
  has_many :alerts
  # validates_presence_of :name

  def active?
    active
  end

  def frequency=(minutes)
    update_attribute(:frequency_in_seconds, minutes*60)
  end

  def frequency
    frequency_in_seconds / 60
  end

  def type
    pretty_class(self.monitorable.class)
  end

  def to_s
    if monitorable.monitored_thing
      "#{pretty_class} for #{monitorable.monitored_thing}"
    else
      "#{pretty_class} for unknown object"
    end
  end

  def owner
    self.user.email
  end

  def pretty_class(klass=monitorable.class)
    klass.to_s.titleize
  end

  def alerting?
    alert = active_alert

    alert ? true : false
  end

  def active_alert
    active_alert = alerts.where(active:true)

    active_alert.empty? ? false : active_alert.first
  end

  def inactive_alerts
    alerts.where(active:false)
  end

  def all_alerts
    alerts.all
  end

  def worker_result(result)
    if result == :alert
      if alerting?
        true # Do nothing
      else
        create_alert
      end
    elsif result == :all_clear
      if alerting?
        resolve_alert
      else
        true # Do nothing
      end
    else
      raise "I don't know about this result: #{result}"
    end
    update_last_checked
    clear_initial_check
  end

  def create_alert
    alerts << Alert.create!
  end

  def resolve_alert
    active_alert.resolve
  end

  def clear_initial_check
    if initial_check?
      update_attribute(:initial_check, false)
    end
  end

  def update_last_checked
    update_attribute(:last_checked, Time.now)
  end

end
