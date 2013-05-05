class MonitorTestController < ApplicationController
  def index
    @monitors = BaseMonitor.all
  end
  def create
    @pingmonitor = PingMonitor.new(params[:ping_monitor])
    if @pingmonitor.save
      flash[:notice] = "Saved!"
    else
      flash[:notice] = "not saved!"
    end
    redirect_to monitor_test_index_path
  end
  def new
    @pingmonitor = PingMonitor.new
    @basemonitor = @pingmonitor.build_BaseMonitor
  end
end
