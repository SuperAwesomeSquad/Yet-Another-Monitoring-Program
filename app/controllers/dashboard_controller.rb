class DashboardController < ApplicationController
before_filter :authenticate_user!

def index
  @monitors = current_user.BaseMonitors
end

end
