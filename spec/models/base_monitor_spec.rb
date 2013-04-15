require 'spec_helper'

describe BaseMonitor do
  before do
    @user = FactoryGirl.create(:user)
    @pm = PingMonitor.create
    @user.BaseMonitors << @pm.BaseMonitor
  end

  it "Cannot create BaseMonitor without an associated monitorable" do
    lambda { BaseMonitor.create! }.should raise_error
  end

  it "Belongs to a specific user" do
    @pm.BaseMonitor.user.id.should eq @user.id
  end

end
