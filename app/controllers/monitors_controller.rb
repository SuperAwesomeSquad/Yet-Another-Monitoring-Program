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
  @monitor = BaseMonitor.new
  # @basemonitor = @monitor.build_BaseMonitor
  # @monitor.user_id = current_user.id

  # @basemonitor.user = current_user
  # @new_monitor = BaseMonitor.new
  # ActiveRecord::Base.transaction do
  #   BaseMonitor.save!
  # end
end

def create
  @monitor = BaseMonitor.new(params[:BaseMonitor])
    if @monitor.save
      flash[:notice] = "Monitor has been created!"
      render :show
    else
      flash[:notice] = "Monitor was not saved!"
      render :new
    end
end

def edit
  @monitor = BaseMonitor.find(params[:id]).monitorable
end

def update
  @monitor = BaseMonitor.find(params[:id]).monitorable
  if @monitor.update_attributes(params[:monitorable])
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
