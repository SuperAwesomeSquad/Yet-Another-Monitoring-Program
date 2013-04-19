require 'spec_helper'

# describe BaseMonitor do
#   before do
#     @user = FactoryGirl.create(:user)
#     @pm = PingMonitor.create
#     @user.BaseMonitors << @pm.BaseMonitor
#   end

# it "accesses the dashboard" do
# 	visit root_path
# 	current_path.should eq admin_dashboard_path
# 	within 'h1' do
# 	    page.should have_content 'Administration'
# 	end
# 	page.should have_content 'Manage Users'
# 	page.should have_content 'Manage Articles'
# end


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

feature 'Edit Monitors' do
	scenario "can edit a monitor" do
		visit '/'
		click_link 'Edit Monitor'
		fill_in 'Name', :with => 'Google'
		fill_in 'URL', :with => "google.com"
		click_button 'Edit Monitor'
		page.should have_content('Monitor has been updated.')
	end
end
