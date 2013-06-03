set :application, "YAMP"
set :repository,  "git://github.com/SuperAwesomeSquad/Yet-Another-Monitoring-Program.git"
set :scm, :git
set :deploy_to, "/home/yamp/yamp"


role :web, "sylvan.nykida.net"
role :db, "sylvan.nykida.net", :primary => true
role :app, "sylvan.nykida.net"

set :user, "yamp"
set :use_sudo, false




# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
