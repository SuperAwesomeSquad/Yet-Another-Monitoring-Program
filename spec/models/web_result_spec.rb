require 'spec_helper'

describe WebResult do
  it "Should construct a WebResult object on successful ping" do
    webresult = FactoryGirl.create(:web_result)
    webresult.successful?.should eq true
  end
  it "Should construct a WebResult object on unsuccessful ping" do
    webresult = FactoryGirl.create(:unsuccessful_web_result)
    webresult.successful?.should eq false
  end
end
