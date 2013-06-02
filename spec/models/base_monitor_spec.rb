require 'spec_helper'

describe BaseMonitor do

  before do
    @user = FactoryGirl.build(:user)
    @pm = FactoryGirl.build(:ping_monitor)
    @bm = @pm.build_BaseMonitor
    @pm.save
    @bm.user = @user
  end

  it "Belongs to a specific user" do
    @bm.user.id.should eq @user.id
  end

  it "Tells you if the monitor is active (by default)" do
    @bm.active?.should eq true
  end

  it "Tells you if the monitor is not active" do
    @bm.update_attribute(:active, false)
    @bm.active?.should eq false
  end

  it "Tells you the frequency in minutes" do
    @bm.update_attribute(:frequency, 10)
    @bm.frequency.should eq 10
  end

  it "Lets you set the frequency in minutes" do
    @bm.update_attribute(:frequency, 10)
    @bm.frequency.should eq 10
    @bm.update_attribute(:frequency, 15)
    @bm.frequency.should eq 15
  end

  it "Belongs to a specific monitor" do
    @bm.monitorable.should be_true
  end

  context "#worker_result" do
    context "when basemonitor is alerting" do
      before do
        @bm.alerts << Alert.new
      end
      it "it will retain alert if worker is alerting" do
        @bm.alerting?.should be_true
        @bm.worker_result(:alert)
        @bm.alerting?.should be_true
      end
      it "it will resolve alert if worker is not alerting" do
        @bm.alerting?.should be_true
        @bm.worker_result(:all_clear)
        @bm.alerting?.should be_false
        @bm.alerts.last.resolution.should eq "automated"
      end
    end
    context "when basemonitor is not alerting" do
      it "it will create an alert if worker is alerting" do
        @bm.alerting?.should be_false
        @bm.worker_result(:alert)
        @bm.alerting?.should be_true
      end
      it "it will retain non-alert if worker is not alerting" do
        @bm.alerting?.should be_false
        @bm.worker_result(:all_clear)
        @bm.alerting?.should be_false
      end
    end
  end
end
