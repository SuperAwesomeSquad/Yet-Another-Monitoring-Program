require 'spec_helper'

describe "the monitor creation process", :type => :feature do
  # before :each do
  #   User.make(:email => 'user@yamp.com', :password => 'password')
  # end

  it "can create a project" do
    visit '/'
    click_link 'New Monitor'
    fill_in 'Hostname', :with => 'Google'
    fill_in 'Description', :with => "My ping monitor for Google"
    click_button 'Create Monitor'
    page.should have_content('Monitor has been created.')
end

  # it "shows me my monitors" do
  #    visit '/dashboard/monitors'
  #    page.should have_content 'Monitors'
  # end

  # it "lets me add a monitor" do
  #    visit '/dashboard/monitors'
  #    click_link 'New Monitor'
  #    #from capybara wiki
  #    #form methods
  #    fill_in('Name', :with => 'Google')
  #    fill_in('Description', :with => 'My Google Monitor')
  #    fill_in('URL', :with => 'google.com')

  #    choose('Monitor Type')
  #    # radio button: ping, file, etc.


  #    check('Choose Frequency')
  #    # checkboxes: hourly/daily/weekly/monthly

  # end

  it "lets me edit an existing monitor" do
     pending
  end

  it "lets me delete an existing monitor" do
     pending
  end

end

# feature 'Monitors' do
#   scenario "are indexed" do
#     visit '/'
#     click_link 'Dashboard'
#     page.should have_content 'Monitors'
#   end
# end

# feature 'Monitors' do
#     scenario "can be created" do
#     visit '/dashboard/monitors'
#     click_link('New Monitor')
#     fill_in 'Name', :with => 'Google'
#     fill_in 'URL', :with => "google.com"
#     click_button 'Create Monitor'
#     page.should have_content('Monitor has been created.')
#   end
# end

# feature 'Edit Monitors' do
#     scenario "can edit a monitor" do
#       pending
#    # visit '/'
#    # click_link 'Edit Monitor'
#    # fill_in 'Name', :with => 'Google'
#    # fill_in 'URL', :with => "google.com"
#    # click_button 'Edit Monitor'
#    # page.should have_content('Monitor has been updated.')
#   end
# end
