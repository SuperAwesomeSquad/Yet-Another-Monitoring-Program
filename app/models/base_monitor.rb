class BaseMonitor < ActiveRecord::Base
  attr_accessible :name, :description, :frequency, :active, :frequency_in_seconds
  belongs_to :monitorable, polymorphic: true
  delegate :do, to: :monitorable
  belongs_to :user
  validates_presence_of :name


  def active?
    active
  end

  def name

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

end
