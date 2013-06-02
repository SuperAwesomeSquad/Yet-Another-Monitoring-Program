class AlertsController < ApplicationController
before_filter :authenticate_user!

def index
  @alerts = current_user.alerts
end

def show
  alert = Alert.find(params[:id])
  if alert.user != current_user
  	flash[:error] = "You do not have permission to view this alert"
  	redirect_to admin_dashboard_path
  else
  	@alert = alert
  end
end

def alerts
    # @alerts = nil
end

end
