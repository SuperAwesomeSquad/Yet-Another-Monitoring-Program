class MonitorsController < ApplicationController
# before_filter :authenticate_user!

def index
   @monitors = BaseMonitor.order("name")
end

def show
  @monitor = BaseMonitor.find(params[:id])
end

  def new
    @monitor = BaseMonitor.new
  end

def create
  @monitor = BaseMonitor.new(params[:id])
    if @monitor.save
      redirect_to @monitor, notice: "Successfully created monitor."
    else
      render :new
    end
 end

def edit
  @monitor = BaseMonitor.find(params[:id])
end

def update
  @monitor = BaseMonitor.find(params[:id])
  if @monitor.update_attributes(params[:monitor])
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
