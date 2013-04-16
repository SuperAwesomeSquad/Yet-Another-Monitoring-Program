require 'spec_helper'

describe PingResult do
  it "Should construct a PingResult object on successful ping" do
    pingresult = FactoryGirl.create(:ping_result)
    pingresult.alert?.should eq false
  end
  it "Should construct a PingResult object on unsuccessful ping" do
    pingresult = FactoryGirl.create(:unsuccessful_ping_result)
    pingresult.alert?.should eq true
  end
end
