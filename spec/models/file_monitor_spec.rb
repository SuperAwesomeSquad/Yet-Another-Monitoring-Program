require 'spec_helper'

describe FileMonitor do
  before do
    @fm = FileMonitor.create
  end
  it "Has an Associated BaseMonitor" do
    @fm.BaseMonitor
  end
  it "Displays the hostname its monitoring"
  it "Handles undefined hosts"
  it "Responds to .type as 'File Monitor'" do
    @fm.type.should eq "File Monitor"
  end
end
