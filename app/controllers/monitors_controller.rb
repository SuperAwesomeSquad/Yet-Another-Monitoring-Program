class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
    @monitors = BaseMonitor.all(params[:name])
   # @new_monitor = BaseMonitor.order("name")
end

def show
  @monitor = BaseMonitor.find(params[:id])
end

def new
  @monitor = PingMonitor.new
  @basemonitor = @monitor.build_BaseMonitor
  # @new_monitor = BaseMonitor.new
  # ActiveRecord::Base.transaction do
  #   BaseMonitor.save!
  # end
end

def create
  @monitor = PingMonitor.new(params[:ping_monitor])
  # @monitor.user = current_user
    if @monitor.save
      flash[:notice] = "Monitor has been created!"
    else
      flash[:notice] = "Monitor was not saved!"
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
  @monitor = BaseMonitor.find(params[:id])
end

def update
  @monitor = BaseMonitor.find(params[:id])
  if @monitor.update_attributes(params[:new_monitor])
    redirect_to @monitor, notice: "Successfully created monitor."
  else
    render :edit
  end
end

def destroy
  @monitor = BaseMonitor.find(params[:id])
  @monitor.destroy
  redirect_to monitors_url, notice: "Successfully deleted a monitor."
end

end
