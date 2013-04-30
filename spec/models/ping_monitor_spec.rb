require 'spec_helper'

describe PingMonitor do

  before do
    @pm = PingMonitor.new(hostname: 'example.com')
    @bm = @pm.create_BaseMonitor
    @pm.save
    @user = FactoryGirl.create(:user)
    @bm.user = @user
  end

  it "Has an Associated BaseMonitor" do
    @pm.BaseMonitor.class.should eq BaseMonitor
  end

  it "Displays the hostname its monitoring" do
    @bm.to_s.should eq "Ping Monitor for #{@pm.hostname}"
  end

  it "Handles undefined hosts" do
    pm = PingMonitor.new
    bm = pm.create_BaseMonitor
    pm.save
    bm.to_s.should eq "Ping Monitor for unknown object"
  end

  it "Responds to .type as 'Ping Monitor'" do
    @bm.type.should eq "Ping Monitor"
  end

  it "Should tell you the owner" do
    @bm.owner.should eq @user.email
  end

  it "Should respond to 'do'" do
    @bm.respond_to?(:do).should eq true
  end

end
