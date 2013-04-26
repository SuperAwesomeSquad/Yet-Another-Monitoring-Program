require 'spec_helper'

feature 'Dashboard' do
	scenario "is visible to logged in user" do
		visit '/'
		click_link 'Log In'
  		fill_in 'Email', with: 'user@example.com'
  		fill_in 'Password', with: 'secret'
  		click_button 'Login'
		current_path.should eq dashboard_path
	end
	scenario "can toggle to alerts" do
		click_link 'Alerts'
 	 	current_path.should eq
	end

end

