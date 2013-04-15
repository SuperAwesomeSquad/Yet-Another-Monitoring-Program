require 'spec_helper'

describe PingMonitor do
  before do
    @pm = PingMonitor.create(hostname: 'example.com')
  end
  it "Has an Associated BaseMonitor" do
    @pm.BaseMonitor
  end
  it "Displays the hostname its monitoring" do
    @pm.to_s.should eq "Ping Monitor for example.com"
  end
  it "Handles undefined hosts" do
    PingMonitor.create.to_s.should eq "Ping Monitor for Undefined Host"
  end
  it "Responds to .type as 'Ping Monitor'" do
    @pm.type.should eq "Ping Monitor"
  end
end
