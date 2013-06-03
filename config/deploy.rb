require 'sidekiq/capistrano'
require 'bundler/capistrano'
require "rvm/capistrano"

set :application, "YAMP"
set :repository,  "git://github.com/SuperAwesomeSquad/Yet-Another-Monitoring-Program.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache

set :deploy_to, "/home/yamp/yamp"

set :ssh_options, { :forward_agent => true }

role :web, "sylvan.nykida.net"
role :db, "sylvan.nykida.net", :primary => true
role :app, "sylvan.nykida.net"

set :user, "yamp"
set :use_sudo, false

namespace(:custom) do
  task :symlink_db, :roles => :app do
  run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

#after "deploy:update_code", "custom:symlink_db"
before "deploy:assets:precompile", "custom:symlink_db"

namespace :deploy do
  desc "Start Thin"
  task :start do
    run "cd /home/yamp/yamp/current; bundle exec thin start -C yamp_prod.yml"
  end

  desc "Stop Thin"
  task :stop do
    run "cd /home/yamp/yamp/current; bundle exec thin stop -C yamp_prod.yml"
  end

  desc "Restart thin"
  task :restart do
    run "cd /home/yamp/yamp/current; bundle exec thin restart -C yamp_prod.yml"
  end
end

