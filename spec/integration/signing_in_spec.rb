require 'spec_helper'

feature 'Signing in' do
	scenario 'via form' do
		User.find_by_email('user@yamp.com')
		visit '/'
		click_link 'Sign In'
		fill_in 'Email', :with => "user@yamp.com"
		fill_in 'Password', :with => "password"
		click_button "Sign in"
		page.has_content?("Signed in successfully.")
	end
end
