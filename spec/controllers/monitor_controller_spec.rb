require 'spec_helper'

# describe BaseMonitor do
#   before do
#     @user = FactoryGirl.create(:user)
#     @pm = PingMonitor.create
#     @user.BaseMonitors << @pm.BaseMonitor
#   end

feature 'Creating Monitors' do
	scenario "can create a monitor" do
		visit '/'
		click_link 'New Monitor'
		fill_in 'Name', :with => 'Google'
		fill_in 'URL', :with => "google.com"
		click_button 'Create Monitor'
		page.should have_content('Monitor has been created.')
	end
end

