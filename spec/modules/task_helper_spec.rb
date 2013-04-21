require 'spec_helper'

#describe TaskHelper do
#  context "#round_minute_to_next_hour" do
#    it "Should handle 60 minutes as 1 hour" do
#      round_minute_to_next_hour(60).should eq 60
#    end
#    it "Should convert 61 minutes to 2 hours" do
#      round_minute_to_next_hour(61).should eq 2
#    end
#    it "Should convert 2000 minutes to 33 hours" do
#      round_minute_to_next_hour(2000).should eq 33
#    end
#  end
#end
require "#{Rails.root}/lib/schedule_tasks.rb"

describe TaskHelper do
  context "#should_it_run?" do
    it "Should run a */5 task at 16:05"
    it "Should run a */5 task at 16:00"
    it "Should not run a */5 task at 16:07"
    it "Should run a */10 task at 16:10"
    it "Should not run a */10 task at 16:05"
    it "Should run an hourly task at 16:00"
    it "Should not run an hourly task at 16:05"
  end
  context "#select_tasks_range" do
    it "Should accept a range"
    it "Should return an array"
  end
  context "#select_all_tasks" do
    it "Should select all tasks"
  end
  context "#round_minute_to_next_hour" do
    it "Should convert 55 minutes to 1 hour"
    it "Should convert 60 minutes to 1 hour"
    it "Should convert 61 minutes to 2 hours"
  end
end




