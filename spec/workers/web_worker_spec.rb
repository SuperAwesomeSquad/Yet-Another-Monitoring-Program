require 'spec_helper'

require 'spec_helper'

describe WebWorker do
  before do
    @ww = WebWorker.new
    @wm = FactoryGirl.create(:web_monitor)
    @bm = @wm.build_BaseMonitor
  end

  it "Should respond to perform" do
    @ww.respond_to?(:perform).should be_true
  end

  context "finding monitors" do
    it "Should find a valid monitor" do
      monitor = @ww.find_monitor(@wm.id)
      monitor.id.should eq @wm.id
    end
    it "Should return nil on an invalid monitor" do
      monitor = @ww.find_monitor(-5)
      monitor.should be_nil
    end
  end

  context "save results" do
    it "Will save to DB" do
      prior_total = PingMonitor.all.size
      @ww.save_result(
        WebResult.new(
          )
        ).should be_true
    end
  end

  context "create_result" do
   it "Will return a built WebResult success on HTTP 200" do
    monitor = double("monitor")
    monitor.stub(:successful).and_return(true)
    monitor.stub(:status_code).and_return(200)
    monitor.stub(:exception).and_return(nil)
    @ww.create_result(monitor).successful.should be_true
  end
  it "Will return a built WebResult fail on HTTP 304" do
    monitor = double("monitor")
    monitor.stub(:successful).and_return(false)
    monitor.stub(:status_code).and_return(304)
    monitor.stub(:exception).and_return(nil)
    @ww.create_result(monitor).successful.should be_false
  end
   it "Will note an exception on a Net::HTTP.ping exception" do
    monitor = double("monitor")
    monitor.stub(:successful).and_return(false)
    monitor.stub(:status_code).and_return(nil)
    monitor.stub(:exception).and_return(true)
    @ww.create_result(monitor).successful.should be_false
  end
end

context "do_ping" do
  it "Should catch an exception with the ping itself"

end

end
