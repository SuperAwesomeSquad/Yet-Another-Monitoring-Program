require "#{Rails.root}/lib/task_helper.rb"
include TaskHelper

namespace :yamp do

  desc "YAMP-Related Rake Tasks"

  task :run_all => :environment do
    select_all_tasks.each do |monitor|
      next if monitor.monitorable.nil?
      monitor.do
    end
  end

  task :run_scheduled_minute => :environment do
    datetime = Time.zone.now
    select_tasks_range((60...3600)).each do |monitor|
      monitor.do if should_it_run?(monitor,datetime)
    end
  end


  task :run_scheduled_hour => :environment do
    datetime = Time.zone.now
    if hour(datetime) % 6 == 0
      select_hourly_tasks(:sixhourly).each do |monitor|
        monitor.do
      end
    end
    if hour(datetime) % 12 == 0
      select_hourly_tasks(:twelvehourly).each do |monitor|
        monitor.do
      end
    end
    select_hourly_tasks.each do |monitor|
      monitor.do
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
