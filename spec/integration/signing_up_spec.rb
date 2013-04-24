require 'spec_helper'

feature 'Signing up' do
	scenario 'Successful sign up' do
		visit root_url
		click_link 'Sign Up'
		fill_in "Email", :with => "user@yamp.com"
		fill_in "Password", :with => "password"
		fill_in "Password confirmation", :with => "password"
		click_button "Sign up"
		page.should have_content("You have signed up successfully.")
	end
end
