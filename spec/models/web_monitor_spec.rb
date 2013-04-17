require 'spec_helper'

describe WebMonitor do
  before do
    @wm = WebMonitor.create(url: 'http://www.google.com')
    @user = FactoryGirl.create(:user)
    @user.BaseMonitors << @wm.BaseMonitor
  end
  it "Has an Associated BaseMonitor" do
    @wm.BaseMonitor.class.should eq BaseMonitor
  end
  it "Displays the hostname its monitoring" do
    @wm.to_s.should eq "Web Monitor for #{@wm.url}"
  end
  it "Handles undefined hosts" do
    WebMonitor.create.to_s.should eq "Web Monitor for unknown object"
  end
  it "Responds to .type as 'Web Monitor'" do
    @wm.type.should eq "Web Monitor"
  end
  it "Should tell you the owner" do
    @wm.owner.should eq @user.email
  end
  it "Should respond to 'do'" do
    @wm.respond_to?(:do).should eq true
  end
end
