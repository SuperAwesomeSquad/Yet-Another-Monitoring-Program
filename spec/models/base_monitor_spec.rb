require 'spec_helper'

describe BaseMonitor do

  it "Belongs to a specific user" do
    user = FactoryGirl.create(:user)
    pm = PingMonitor.create
    bm = pm.create_BaseMonitor
    bm.user = user
    bm.user.id.should eq user.id
  end

  it "Tells you if the monitor is active (by default)" do
    BaseMonitor.create!.active?.should eq true
  end

  it "Tells you if the monitor is not active" do
    BaseMonitor.create!(active: false).active?.should eq false
  end

  it "Tells you the frequency in minutes" do
    bm = BaseMonitor.create!(frequency: 10)
    bm.frequency.should eq 10
  end

  it "Lets you set the frequency in minutes" do
    bm = BaseMonitor.create!(frequency: 10)
    bm.frequency.should eq 10
    bm.update_attribute(:frequency, 15)
    bm.frequency.should eq 15
  end

end
