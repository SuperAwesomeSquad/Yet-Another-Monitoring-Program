require 'spec_helper'

feature 'Accessible dashboard' do
	scenario "can visit dashboard" do
		visit '/'
		click_link 'Login'
  		fill_in 'Email', with: 'user@example.com'
  		fill_in 'Password', with: 'secret'
  		click_button 'Login'
		current_path.should eq dashboard_path
	end
	# scenario "can toggle to alerts" do
	# 	visit '/'
 #  		page.should have_link 'Alerts'
	# end

end

