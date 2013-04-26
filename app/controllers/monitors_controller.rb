class MonitorsController < ApplicationController
before_filter :authenticate_user!

def index
end

def new
  @monitor = BaseMonitor.new
end

def show
  @monitor = BaseMonitor.find(params[:id])
end

def create
  @monitor = BaseMonitor.new(params[:monitor])
  if @monitor.save
    flash[:notice] = "Project has been created."
    redirect_to @monitor
  else
  # nothing, yet end
  end
##drop down? form will change
##frequency
##host information
##partial form for ping; file;
##cases?
end

def delete
end

end
