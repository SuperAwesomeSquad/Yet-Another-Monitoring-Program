class DashboardController < ApplicationController
before_filter :authenticate_user!

def index
  @pingmonitors = BaseMonitor.all
end

def show
end

end
