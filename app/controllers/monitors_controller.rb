class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
    @pingmonitors = BaseMonitor.all(params[:name])
   # @new_monitor = BaseMonitor.order("name")
end

def show
  @pingmonitor = BaseMonitor.find(params[:id])
end

def new
  @pingmonitor = PingMonitor.new
  @basemonitor = @pingmonitor.build_BaseMonitor
  # @new_monitor = BaseMonitor.new
  # ActiveRecord::Base.transaction do
  #   BaseMonitor.save!
  # end
end

def create
  @pingmonitor = PingMonitor.new(params[:ping_monitor])
  # @pingmonitor.user = current_user
    if @pingmonitor.save
      flash[:notice] = "Monitor has been created!"
    else
      flash[:notice] = "Monitor was not saved!"
    end
    redirect_to monitor_path
  # @new_monitor = BaseMonitor.new(params[:id])
  #   if @new_monitor.save
  #     redirect_to @new_monitor, notice: "Successfully created monitor."
  #   else
  #     render :new
  #   end
 end

def edit
  @pingmonitor = BaseMonitor.find(params[:id])
end

def update
  @pingmonitor = BaseMonitor.find(params[:id])
  if @pingmonitor.update_attributes(params[:pingmonitor])
    redirect_to @pingmonitor, success: "Successfully updated monitor."
  else
    redirect_to @pingmonitor, success: "Monitor has not been updated."
    render :action => "edit"
  end
end

def destroy
  @pingmonitor = BaseMonitor.find(params[:id])
  @pingmonitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end
