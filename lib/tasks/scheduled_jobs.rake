require "#{Rails.root}/lib/schedule_tasks.rb"
include TaskHelper

namespace :yamp do

  desc "YAMP-Related Rake Tasks"

  task :run_all => :environment do
    select_all_tasks.each do |monitor|
      monitor.do
    end
  end

  task :run_scheduled_minute => :environment do
    datetime = Time.zone.now
    select_tasks_range((60...3600)).each do |monitor|
      puts monitor
      if should_it_run?(datetime, monitor)
        puts "I ran!"
      else
        puts "I didn't run!"
      end
      monitor.do if should_it_run?(datetime,monitor)
    end
  end


  task :run_scheduled_hour => :environment do
    datetime = Time.zone.now
    select_tasks_range((3600...86400)).each do |monitor|
      monitor.do if should_it_run?(datetime,monitor)
    end
  end

  task :run_scheduled_day => :environment do
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end

  task :run_scheduled_week => :environment do
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end

end
