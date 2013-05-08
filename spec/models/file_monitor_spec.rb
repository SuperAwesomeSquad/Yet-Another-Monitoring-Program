require 'spec_helper'

describe FileMonitor do
  before do
    @fm = FileMonitor.create
    @bm = @fm.create_BaseMonitor
    @fm.save
    @user = FactoryGirl.create(:user)
    @bm.user = @user
  end
  it "Has an Associated BaseMonitor" do
    @fm.BaseMonitor.class.should eq BaseMonitor
  end
  it "Displays the hostname its monitoring"
  it "Handles undefined hosts"
  it "Responds to .type as 'File Monitor'" do
    @bm.type.should eq "File Monitor"
  end
  it "Should tell you the owner" do
    @bm.owner.should eq @user.email
  end
end
