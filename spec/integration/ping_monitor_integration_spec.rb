require 'spec_helper'

feature "Ping Monitor Integration Spec" do
  before do
    @user = FactoryGirl.create(:user)
    @pm = PingMonitor.new(hostname:'127.0.0.1')
    @pm.build_BaseMonitor(description: 'test monitor')
    @pm.save
    @bm = @pm.BaseMonitor
    @bm.user = @user
  end

  scenario "Create a Ping Monitor" do
    @bm.should_not be_nil
    @user.id.should eq @bm.user.id
  end

  scenario "PingMonitor#do will push a job to redis queue" do
    PingWorker.jobs.size.should eq 0
    @bm.do
    PingWorker.jobs.size.should eq 1
    PingWorker.jobs[0]['args'][0].should eq @pm.id
    PingWorker.jobs.clear
  end

  scenario "PingMonitor#do is Successful and Logs new Result object" do
    PingWorker.perform_async(@pm.id)
    pr = PingResult.all.size
    PingWorker.drain
    PingResult.all.size.should eq pr +1
    PingResult.last.ping_monitor_id.should eq @pm.id
    PingResult.last.successful.should be_true
  end

  scenario "Ping monitor is unsuccessful and creates new alert" do
    @user = FactoryGirl.create(:user)
    @pm = PingMonitor.new(hostname:'nykhgfhgfhfhgfida.net')
    @pm.build_BaseMonitor(description: 'test monitor')
    @pm.save
    @bm = @pm.BaseMonitor
    @bm.user = @user
    PingWorker.perform_async(@pm.id)
    pr = PingResult.all.size
    PingWorker.drain
    PingResult.all.size.should eq pr +1
    PingResult.last.ping_monitor_id.should eq @pm.id
    @bm.alerting?.should be_true
  end

  scenario "Ping monitor is unsuccessful and doesn't create new alert if already alerting" do
  end
end

