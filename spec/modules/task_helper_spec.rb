require 'spec_helper'
require "#{Rails.root}/lib/task_helper.rb"
include TaskHelper

describe TaskHelper do

  context "#should_it_run?" do

    it "Should run a */5 task at 16:05" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(5)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,5) do
        should_it_run?(monitor).should eq true
      end
    end
    it "Should run a */5 task at 16:00" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(5)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16) do
        should_it_run?(monitor).should eq true
      end
    end

    it "Should not run a */5 task at 16:07" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(5)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,7) do
        should_it_run?(monitor).should eq false
      end
    end

    it "Should run a */10 task at 16:10" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(10)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,10) do
        should_it_run?(monitor).should eq true
      end
    end

    it "Should not run a */10 task at 16:05" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(10)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,5) do
        should_it_run?(monitor).should eq false
      end
    end

    it "Should run an hourly task at 16:00" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(60)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16) do
        should_it_run?(monitor).should eq true
      end
    end

    it "Should not run an hourly task at 16:05" do
      monitor = double("BaseMonitor")
      monitor.stub(:frequency).and_return(60)
      monitor.stub(:active?).and_return(true)
      Timecop.travel(2008, 10, 5,16,5) do
        should_it_run?(monitor).should eq false
      end
    end
  end

  context "#select_hourly_tasks" do
    before do
      @bm_hourly = BaseMonitor.create!(frequency: 60)
      @bm_sixhourly = BaseMonitor.create!(frequency: 60*6)
      @bm_twelvehourly = BaseMonitor.create!(frequency: 60*12)
      @bm_minutely = BaseMonitor.create!(frequency: 5)
    end

    it "Should select hourly tasks by default" do
      tasks = TaskHelper::select_hourly_tasks
      task_ids = tasks.map{|t| t.id}
      task_ids.include?(@bm_hourly.id).should eq true
      task_ids.include?(@bm_sixhourly.id).should eq false
      task_ids.include?(@bm_twelvehourly.id).should eq false
      task_ids.include?(@bm_minutely.id).should eq false
    end
    it "should select */6 tasks when requested" do
      tasks = TaskHelper::select_hourly_tasks(:sixhourly)
      task_ids = tasks.map{|t| t.id}
      task_ids.include?(@bm_hourly.id).should eq false
      task_ids.include?(@bm_sixhourly.id).should eq true
      task_ids.include?(@bm_twelvehourly.id).should eq false
      task_ids.include?(@bm_minutely.id).should eq false
    end

    it "should select */12 tasks when requested" do
      tasks = TaskHelper::select_hourly_tasks(:twelvehourly)
      task_ids = tasks.map{|t| t.id}
      task_ids.include?(@bm_hourly.id).should eq false
      task_ids.include?(@bm_sixhourly.id).should eq false
      task_ids.include?(@bm_twelvehourly.id).should eq true
      task_ids.include?(@bm_minutely.id).should eq false
    end
  end



  context "#select_tasks_range" do

    it "Should return useful information"
# bm_hourly = BaseMonitor.create!(frequency: 60)
# bm_sixhourly = BaseMonitor.create!(frequency: 60*6)
# bm_twelvehourly = BaseMonitor.create!(frequency: 60*12)
# bm_minutely = BaseMonitor.create!(frequency: 5)
# tasks = TaskHelper::select_tasks_range((0..60)).should eq ActiveRecord::Relation
# task_ids = tasks.map{|t| t.id}
# task_ids.include?(bm_hourly.id).should eq false
# task_ids.include?(bm_sixhourly.id).should eq false
# task_ids.include?(bm_twelvehourly.id).should eq false
# task_ids.include?(bm_minutely.id).should eq true
# end

# end
  end

  context "#select_all_tasks" do

    it "Should select all active tasks" do
      TaskHelper::select_all_tasks.size.should eq BaseMonitor.all.size
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
