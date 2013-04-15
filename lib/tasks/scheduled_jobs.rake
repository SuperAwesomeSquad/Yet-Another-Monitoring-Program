namespace :yamp do
  desc "Run all tasks marked as active"
  task :run_all => :environment do
    BaseMonitor.where(active: true).each do |monitor|
      monitor.do
    end
  end
end
