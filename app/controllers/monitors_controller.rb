class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
  @pingmonitors = BaseMonitor.all

   # @new_monitor = BaseMonitor.order("name")
end

def show
  @pingmonitor = BaseMonitor.find(params[:id]).monitorable
end

def new
  @pingmonitor = PingMonitor.new
  @basemonitor = @pingmonitor.build_BaseMonitor
  # @basemonitor.user = current_user
  # @new_monitor = BaseMonitor.new
  # ActiveRecord::Base.transaction do
  #   BaseMonitor.save!
  # end
end

def create
  @pingmonitor = PingMonitor.new(params[:ping_monitor])

  # binding.pry
    if @pingmonitor.save
      flash[:notice] = "Monitor has been created!"
    else
      flash[:notice] = "Monitor was not saved!"
    end
    redirect_to monitors_path
end

def edit
  @pingmonitor = BaseMonitor.find(params[:id]).monitorable
end

def update
  @pingmonitor = BaseMonitor.find(params[:id]).monitorable
  if @pingmonitor.update_attributes(params[:ping_monitor])
    flash[:success]= "Successfully updated monitor."
    render :action => "show", :id=>@pingmonitor.BaseMonitor
  else
    flash[:alert]= "Monitor has not been updated."
    render :action => "edit"
  end
  # redirect_to monitors_path
end

def destroy
  @pingmonitor = BaseMonitor.find(params[:id])
  @pingmonitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end
