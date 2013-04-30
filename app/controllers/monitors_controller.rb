class MonitorsController < ApplicationController
# before_filter :authenticate_user!

def index
   @new_monitor = PingMonitor.order("name")
end

def show
  @new_monitor = PingMonitor.find(params[:id])
end

def new
  @new_monitor = PingMonitor.new
  # ActiveRecord::Ping.transaction do
  #   PingMonitor.save!
  # end
end

def create
  @new_monitor = PingMonitor.new(params[:id])
    if @new_monitor.save
      redirect_to @new_monitor, notice: "Successfully created monitor."
    else
      render :new
    end
 end

def edit
  @new_monitor = PingMonitor.find(params[:id])
end

def update
  @new_monitor = PingMonitor.find(params[:id])
  if @new_monitor.update_attributes(params[:new_monitor])
    redirect_to @new_monitor, notice: "Successfully created monitor."
  else
    render :edit
  end
end

def destroy
  @new_monitor = PingMonitor.find(params[:id])
  @new_monitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end
