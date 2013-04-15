require 'spec_helper'

describe PingMonitor do
  before do
    @pm = PingMonitor.create(hostname: 'example.com')
    @user = FactoryGirl.create(:user)
    @user.BaseMonitors << @pm.BaseMonitor
  end
  it "Has an Associated BaseMonitor" do
    @pm.BaseMonitor.class.should eq BaseMonitor
  end
  it "Displays the hostname its monitoring" do
    @pm.to_s.should eq "Ping Monitor for example.com"
  end
  it "Handles undefined hosts" do
    PingMonitor.create.to_s.should eq "Ping Monitor for Undefined Host"
  end
  it "Responds to .type as 'Ping Monitor'" do
    @pm.type.should eq "Ping Monitor"
  end
  it "Should tell you the owner" do
    @pm.owner.should eq @user.email
  end
end
