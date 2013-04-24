namespace :filler do
  desc "Fill all the databases"
  task :run_all => :environment do
    frequency_in_seconds = [5,10,15,20,30,60].map{|i| i*60}
    PingMonitor.create!
    end
  end
end
