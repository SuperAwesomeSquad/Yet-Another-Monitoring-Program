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
include TaskHelper

describe TaskHelper do

  context "#should_it_run?" do

    it "Should run a */5 task at 16:05" do
      @monitor = double("BaseMonitor")
      @monitor.stub(:frequency).and_return(5)
      @monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,5) do
        TaskHelper::should_it_run?(@monitor).should eq true
      end
    end
    it "Should run a */5 task at 16:00" do
      @monitor = double("BaseMonitor")
      @monitor.stub(:frequency).and_return(5)
      @monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16) do
        TaskHelper::should_it_run?(@monitor).should eq true
      end
    end

    it "Should not run a */5 task at 16:07" do
      @monitor = double("BaseMonitor")
      @monitor.stub(:frequency).and_return(5)
      @monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,7) do
        TaskHelper::should_it_run?(@monitor).should eq false
      end
    end

    it "Should run a */10 task at 16:10" do
     @monitor = double("BaseMonitor")
     @monitor.stub(:frequency).and_return(10)
     @monitor.stub(:active?).and_return(true)
     Timecop.travel(2008, 10, 5,16,10) do
      TaskHelper::should_it_run?(@monitor).should eq true
    end
  end

    it "Should not run a */10 task at 16:05" do
     @monitor = double("BaseMonitor")
     @monitor.stub(:frequency).and_return(10)
     @monitor.stub(:active?).and_return(true)
     Timecop.travel(2008, 10, 5,16,5) do
      TaskHelper::should_it_run?(@monitor).should eq false
    end
  end

    it "Should run an hourly task at 16:00" do
      @monitor = double("BaseMonitor")
      @monitor.stub(:frequency).and_return(60)
      @monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16) do
        TaskHelper::should_it_run?(@monitor).should eq true
      end
    end

    it "Should not run an hourly task at 16:05" do
      @monitor = double("BaseMonitor")
      @monitor.stub(:frequency).and_return(60)
      @monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,5) do
        TaskHelper::should_it_run?(@monitor).should eq false
      end
    end

end
context "#select_tasks_range" do

  it "Should accept a range" do
    # test
  end

  it "Should return an array" do
    # test
  end

end

context "#select_all_tasks" do

  it "Should select all tasks" do
    #test
  end

end
context "#round_minute_to_next_hour" do

  it "Should convert 55 minutes to 1 hour" do
    TaskHelper::round_minute_to_next_hour(55).should eq 1
  end
  it "Should convert 60 minutes to 1 hour" do
    TaskHelper::round_minute_to_next_hour(60).should eq 1

  end

  it "Should convert 61 minutes to 2 hours" do
    TaskHelper::round_minute_to_next_hour(61).should eq 2

  end
end
end




