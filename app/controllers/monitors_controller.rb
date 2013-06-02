class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
  @monitors = BaseMonitor.all
   # @new_monitor = BaseMonitor.order("name")
end

def show
  @monitor = BaseMonitor.find(params[:id]).monitorable
end

def new
  @monitor = PingMonitor.new
  @basemonitor = @monitor.build_BaseMonitor
end

def create
  @monitor = PingMonitor.new(params[:ping_monitor])
  @monitor.BaseMonitor.user = current_user
  binding.pry
    if @monitor.save
      flash[:notice] = "Monitor has been created!"
    else
      flash[:notice] = "Monitor was not saved!"
    end
    redirect_to monitors_path
end

def edit
  @monitor = BaseMonitor.find(params[:id]).monitorable
end

def update
  @monitor = BaseMonitor.find(params[:id]).monitorable
  if @monitor.update_attributes(params[:ping_monitor])
    flash[:success]= "Successfully updated monitor."
    render :action => "show", :id=>@monitor.BaseMonitor
  else
    flash[:alert]= "Monitor has not been updated."
    render :action => "edit"
  end
  # redirect_to monitors_path
end

def destroy
  @monitor = BaseMonitor.find(params[:id])
  @monitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end

##submit button to the same controller action
##create a conditional (the monitorable type) into the post
##def create_monitor
##if
