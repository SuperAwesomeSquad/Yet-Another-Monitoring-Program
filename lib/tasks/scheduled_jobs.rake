namespace :yamp do
  include TaskHelper

  desc "YAMP-Related Rake Tasks"

  task :run_all => :environment do
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end

  task :run_scheduled_minute => :environment do
    minute = Time.zone.now.strftime('%M').to_i
    BaseMonitor.where(active: true, frequency_in_seconds: 60...3600).each do |monitor|
      monitor.do if (monitor.frequency % minute == 0)
    end
  end


  task :run_scheduled_hour => :environment do
    hour = Time.zone.now.strftime('%H')
    BaseMonitor.where(active: true, frequency_in_seconds: 3600...86400).each do |monitor|
      monitor.do if round_minute_to_next_hour(monitor.frequency) == hour
    end
  end

  task :run_scheduled_day => :environment do
    day_of_week = Time.zone.now.strftime('%A')
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end

  task :run_scheduled_week => :environment do
    day_of_week = Time.zone.now.strftime('%A')
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end

end
