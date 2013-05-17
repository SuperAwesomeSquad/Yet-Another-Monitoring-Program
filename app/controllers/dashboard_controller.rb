class DashboardController < ApplicationController
before_filter :authenticate_user!

def index
  @monitors = BaseMonitor.all
end

end
