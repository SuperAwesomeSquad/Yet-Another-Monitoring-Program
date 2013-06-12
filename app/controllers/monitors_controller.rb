class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
  @monitors = current_user.BaseMonitors
end

def show
  @basemonitor = BaseMonitor.find(params[:id])
  @monitor = @basemonitor.monitorable
  if @basemonitor.user.id != current_user.id
    flash[:notice] = "You are not authorized to view this monitor"
    redirect_to root_path
  end
  if @basemonitor.active_alert
    @alert_duration = @basemonitor.active_alert.duration
  end
  @last_checked = @basemonitor.last_checked

end

def new
  @monitor = PingMonitor.new
  @basemonitor = @monitor.build_BaseMonitor
end

def create
  @monitor = PingMonitor.new(params[:ping_monitor])
  @monitor.BaseMonitor.user = current_user
    if @monitor.save
      flash[:notice] = "Monitor has been created!"
      @monitor.BaseMonitor.do
      redirect_to monitor_path(@monitor.BaseMonitor)
    else
      flash[:notice] = "Monitor was not saved!"
      redirect_to new_monitor_path
    end
end

def edit
  @monitor = BaseMonitor.find(params[:id]).monitorable
end

def update
  @monitor = BaseMonitor.find(params[:id]).monitorable
  if @monitor.update_attributes(params[:ping_monitor])
    flash[:success]= "Successfully updated monitor."
    redirect_to monitor_path(@monitor.BaseMonitor)
  else
    flash[:alert]= "Monitor has not been updated."
    render :action => "edit"
  end
end

def destroy
  @monitor = BaseMonitor.find(params[:id])
  @monitor.destroy
  redirect_to monitors_url, notice: "Monitor deleted"
end

end

##submit button to the same controller action
##create a conditional (the monitorable type) into the post
##def create_monitor
##if
