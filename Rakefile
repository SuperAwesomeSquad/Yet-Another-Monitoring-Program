#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

YetAnotherMonitoringProgram::Application.load_tasks


# http://stackoverflow.com/questions/4118449/should-rake-spec-in-rspec-3-always-end-with-rake-aborted

# This clears the default spec task from MyApp::Application.load_tasks
Rake::Task["spec"].clear

# This defines your new spec task with a suppressed stack trace
RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
end
