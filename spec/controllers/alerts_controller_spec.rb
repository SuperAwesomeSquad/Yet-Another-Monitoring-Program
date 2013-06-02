require 'spec_helper'

describe AlertsController do
    include AuthenticationHelpers
    before do
        @user_with_alerts = FactoryGirl.create(:user)
        @user_without_alerts = FactoryGirl.create(:user)
        pm = PingMonitor.new(hostname: 'nykida.net')
        @non_alert_bm = pm.create_BaseMonitor
        @non_alert_bm.user = @user_without_alerts
        @non_alert_bm.save
        @non_alert_bm.alerts << Alert.new(active: false, resolution: :automated)
        # @non_alert_bm.alerts.last.update_attribute('duration', 14)
        pm = PingMonitor.new(hostname: 'nykidaefsfskdf.net')
        @alert_bm = pm.create_BaseMonitor
        @alert_bm.user = @user_with_alerts
        @alert_bm.save
        @alert_bm.alerts << Alert.new(active:true)
    end

    describe "GET #index" do
        it "shows a user their active alerts if they exist" do
            sign_in @user_with_alerts
            get :index
            assigns(:alerts).size.should eq 1
        end
        it "shows a user an all-clear if no alerts exist" do
            sign_in @user_without_alerts
            get :index
            assigns(:alerts).should eq false
        end
        it "Redirect a non-signed in user to sign in" do
            get :index
            response.should redirect_to(new_user_session_path)
        end
    end

    describe "GET #show" do
        it "returns an alert if a user is authorized to see it"
        it "redirects a non-authorised user to dashboard home"
        it "redirects a user requesting a non-exist user to dashboard home"
    end
end