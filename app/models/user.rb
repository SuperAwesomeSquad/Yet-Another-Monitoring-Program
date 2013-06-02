class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :base_monitors
  has_many :alerts, through: :base_monitors
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :BaseMonitors
  has_one :dashboard


  def to_s
  	self.email
  end

  def has_alerts?
    get_active_alerts ? true : false
  end

  def get_alerts(type=:active)
    case type
    when :active
      get_active_alerts
    when :inactive
      get_inactive_alerts
    when :all
      get_all_alerts
    end
  end

  def get_inactive_alerts
     user_alerts = alerts.where(active: false)
    !user_alerts.empty? ? user_alerts : false
  end

   def get_all_alerts
     user_alerts = alerts
  end

  def get_active_alerts
    user_alerts = alerts.where(active: true)
    !user_alerts.empty? ? user_alerts : false
  end

end
