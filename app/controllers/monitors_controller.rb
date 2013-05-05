class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
    @monitors = BaseMonitor.all
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
    if @pingmonitor.save
      flash[:notice] = "Monitor has been created!"
    else
      render :new, flash[:notice] = "Monitor was not saved!"
    end
    redirect_to monitors_path
  # @new_monitor = BaseMonitor.new(params[:id])
  #   if @new_monitor.save
  #     redirect_to @new_monitor, notice: "Successfully created monitor."
  #   else
  #     render :new
  #   end
 end

def edit
  @new_monitor = BaseMonitor.find(params[:id])
end

def update
  @new_monitor = BaseMonitor.find(params[:id])
  if @new_monitor.update_attributes(params[:new_monitor])
    redirect_to @new_monitor, notice: "Successfully created monitor."
  else
    render :edit
  end
end

def destroy
  @new_monitor = BaseMonitor.find(params[:id])
  @new_monitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end
