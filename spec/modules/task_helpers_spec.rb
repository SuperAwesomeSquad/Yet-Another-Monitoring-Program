require 'spec_helper'

describe TaskHelper do
  context "#round_minute_to_next_hour" do
    it "Should handle 60 minutes as 1 hour" do
      round_minute_to_next_hour(60).should eq 60
    end
    it "Should convert 61 minutes to 2 hours" do
      round_minute_to_next_hour(61).should eq 2
    end
    it "Should convert 2000 minutes to 33 hours" do
      round_minute_to_next_hour(2000).should eq 33
    end
  end
end

