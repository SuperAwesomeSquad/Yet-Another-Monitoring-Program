require 'spec_helper'

describe PingResult do
  it "Should construct a PingResult object on successful ping" do
    pingresult = FactoryGirl.create(:ping_result)
    pingresult.successful?.should eq true
  end
  it "Should construct a PingResult object on unsuccessful ping" do
    pingresult = FactoryGirl.create(:unsuccessful_ping_result)
    pingresult.successful?.should eq false
  end
end
