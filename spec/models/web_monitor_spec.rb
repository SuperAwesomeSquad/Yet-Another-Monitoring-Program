require 'spec_helper'

describe WebMonitor do
  before do
    @wm = WebMonitor.new(url: 'google.com')
    @bm = @wm.create_BaseMonitor
    @wm.save
    @user = FactoryGirl.create(:user)
    @bm.user = @user
  end

  it "Has an Associated BaseMonitor" do
    @wm.BaseMonitor.class.should eq BaseMonitor
  end

  it "Displays the hostname its monitoring" do
    @bm.to_s.should eq "Web Monitor for #{@wm.url}"
  end

  it "Handles undefined hosts" do
    wm = WebMonitor.new
    bm = wm.create_BaseMonitor
    wm.save
    bm.to_s.should eq "Web Monitor for unknown object"
  end

  it "Responds to .type as 'Web Monitor'" do
    @bm.type.should eq "Web Monitor"
  end

  it "Should tell you the owner" do
    @bm.owner.should eq @user.email
  end

  it "Should respond to 'do'" do
    @bm.respond_to?(:do).should eq true
  end

end
