require 'spec_helper'

describe Alert do
  before do
    @pm = PingMonitor.new(hostname: 'example.com')
    @bm = @pm.create_BaseMonitor
    @user = FactoryGirl.create(:user)
    @bm.user = @user
  end

  context "creating new alert" do
    it "will create a new alert" do
      @bm.alerts.size.should eq 0
      @bm.alerts << Alert.new
      @bm.alerts.size.should eq 1
    end

    it "will associate alert with user" do
      @pm.save
      @bm.alerts.size.should eq 0
      @bm.alerts << Alert.new
      @user.alerts.size.should eq 1
      @bm.alerts.last.user.should eq @user
    end

    it "belongs to a BaseMonitor" do
      @pm.save
      @bm.alerts << Alert.new
      @bm.alerts.last.base_monitor_id.should eq @bm.id
    end
  end

  context "#duration" do
    it "returns the alert duration if an alert is not active" do
      time = Time.current
      alert = Alert.new(active: false, alert_start: time, alert_end: time.in(15))
      alert.duration.should eq 15
    end
    it "returns the alert duration if an alert is active" do
      time = Time.current
      alert = Alert.new(active: true, alert_start: time.ago(30))
      alert.duration.should be_within(1).of(30)
    end

  end

  context "#failure_monitor" do
    it "returns the alert failure_monitor" do
      alert = Alert.new
      @bm.alerts << alert
      alert.base_monitor.id.should eq @bm.id
    end
  end

  context "#active?" do
    it "returns the true if alert active" do
      Alert.new(active:true).active?.should be_true
    end
    it "returns the false if alert active" do
      Alert.new(active:false).active?.should be_false
    end
  end
  context "#resolution" do
    it "returns the alert resolution"
  end

  context "#resolve" do
    it "resolves the issue" do
      alert = Alert.new
      alert.resolve
      alert.active?.should be_false
    end
    it "resolves the issue with default of automated" do
      alert = Alert.new
      alert.resolve
      alert.active?.should be_false
      alert.resolution.should eq :automated
    end

 it "resolves the issue with custom symbols" do
      alert = Alert.new
      alert.resolve(:user)
      alert.active?.should be_false
      alert.resolution.should eq :user
    end

  end


  context "BaseMonitor" do
    context "#alerting?" do
      it "returns alert object if monitor alerting"
      it "returns false if monitor is not alerting"
    end
    context "#alerts(:inactive)" do
      it "returns all inactive alerts"
    end
    context "#alert(:all)" do
      it "returns all alerts"
    end
  end

  context "User" do
    context "#alerts?" do
      it "tells if there are any active alerts"
    end
     context "#alerts(:inactive)" do
      it "returns all inactive alerts belonging to user"
    end
    context "#alerts(:active)" do
      it "returns all active alerts belonging to user"
    end
    context "#alerts(:all)" do
      it "returns all alerts belonging to user"
    end
  end
end
