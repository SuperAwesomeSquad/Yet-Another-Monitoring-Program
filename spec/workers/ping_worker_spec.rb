require 'spec_helper'

describe PingWorker do
  before do
    @pw = PingWorker.new
    @pm = FactoryGirl.create(:ping_monitor)
    @bm = @pm.build_BaseMonitor
  end

  it "Should respond to perform" do
    @pw.respond_to?(:perform).should be_true
  end

  context "finding monitors" do
    it "Should find a valid monitor" do
      monitor = @pw.find_monitor(@pm.id)
      monitor.id.should eq @pm.id
    end
    it "Should return nil on an invalid monitor" do
      monitor = @pw.find_monitor(-5)
      monitor.should be_nil
    end
  end

  context "save results" do
    it "Will save to DB" do
      prior_total = PingMonitor.all.size
      @pw.save_result(
        PingResult.new(
        )
      ).should be_true
    end
  end

  context "create_result" do
    it "Will return a built PingResult with successful on success" do
      monitor = double("monitor")
      monitor.stub(:successful).and_return(true)
      monitor.stub(:duration).and_return(5)
      @pw.create_result(monitor).successful.should be_true
    end
    it "Will return a built Pingresult with fail on fail" do
      monitor = double("monitor")
      monitor.stub(:successful).and_return(false)
      monitor.stub(:duration).and_return(5)
      @pw.create_result(monitor).successful.should be_false
    end
  end

  context "do_ping" do
    it "Should catch an exception with the ping itself"

  end

end
