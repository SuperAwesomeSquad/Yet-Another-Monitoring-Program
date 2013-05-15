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
    it "returns the alert resolution" do
      alert = Alert.new
      alert.resolve(:derp)
      alert.resolution.should eq :derp
    end
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
      it "returns true if monitor alerting" do
        alert = Alert.new
        @bm.alerts << alert
        @bm.alerting?.should be_true
      end
      it "returns false if monitor is not alerting" do
        alert = Alert.new(active: false)
        @bm.alerts << alert
        @bm.alerting?.should be_false
      end
      it "returns true if one monitor is alerting, but others are not" do
        @bm.alerts << Alert.new(active:false)
        @bm.alerts << Alert.new(active:true)
        @bm.alerting?.should be_true
      end
    end

    context "#active_alert" do
      it "will return an alert object if active" do
        @bm.alerts << Alert.new(active:true)
        @bm.alerts << Alert.new(active:false)
        @bm.active_alert.class.should eq Alert
      end
      it "will return false if no active alert" do
        @bm.alerts << Alert.new(active:false)
        @bm.alerts << Alert.new(active:false)
        @bm.active_alert.should eq false
      end
    end

    context "#inactive_alerts" do
      it "returns all inactive alerts" do
        5.times do
          @bm.alerts << Alert.new(active:false)
        end
        @bm.alerts << Alert.new(active:true)
        @bm.inactive_alerts.size.should eq 5
      end
    end

    context "#all_alerts" do
      it "returns all alerts" do
        5.times do
          @bm.alerts << Alert.new(active:false)
        end
        @bm.alerts << Alert.new(active:true)
        @bm.all_alerts.size.should eq 6
      end
    end
  end

  context "User" do
    context "#has_alerts?" do
      it "returns true if there are active alerts for user" do
        @bm.save
        @bm.alerts << Alert.new
        @bm.alerts << Alert.new(active:false)
        @user.has_alerts?.should be_true
      end
      it "returns false if there are no active alerts for user" do
        @bm.save
        @user.has_alerts?.should be_false
      end
    end

    context "#get_alerts(:inactive)" do
      it "returns all inactive alerts belonging to user" do
        @bm.save
        @bm.alerts << Alert.new
        @bm.alerts << Alert.new(active:false)
        @user.get_alerts(:inactive).size.should eq 1
      end
    end
    context "#get_alerts(:active)" do
      it "returns all active alerts belonging to user"  do
        @bm.save
        @bm.alerts << Alert.new
        @bm.alerts << Alert.new(active:false)
        @user.get_alerts(:inactive).size.should eq 1
      end
    end
    context "#get_alerts(:all)" do
      it "returns all alerts belonging to user"  do
        @bm.save
        @bm.alerts << Alert.new
        @bm.alerts << Alert.new(active:false)
        @user.get_alerts(:all).size.should eq 2
      end
    end
    context "#get_alerts" do
      it "returns active alerts by default"  do
        @bm.save
        active_alert = Alert.new
        inactive_alert = Alert.new(active:false)
        @bm.alerts << active_alert
        @bm.alerts << inactive_alert
        user_alerts = @user.get_alerts
        user_alerts.size.should eq 1
        user_alerts.should include(active_alert)
        user_alerts.should_not include(inactive_alert)
      end
    end
  end
end
