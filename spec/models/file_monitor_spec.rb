require 'spec_helper'

describe FileMonitor do
  before do
    @fm = FileMonitor.create
    @user = FactoryGirl.create(:user)
    @user.BaseMonitors << @fm.BaseMonitor
  end
  it "Has an Associated BaseMonitor" do
    @fm.BaseMonitor.class.should eq BaseMonitor
  end
  it "Displays the hostname its monitoring"
  it "Handles undefined hosts"
  it "Responds to .type as 'File Monitor'" do
    @fm.type.should eq "File Monitor"
  end
  it "Should tell you the owner" do
    @fm.owner.should eq @user.email
  end
end
