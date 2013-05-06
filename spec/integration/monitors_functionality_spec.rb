require 'spec_helper'

describe "monitors", :type => :feature do
  # before :each do
  #   User.make(:email => 'user@yamp.com', :password => 'password')
  # end

  it "can be created" do
    visit '/'
    click_link 'New Monitor'
    fill_in('Hostname', :with => 'Google.com')
    fill_in('Name', :with => 'Google')
    fill_in('Description', :with => "My ping monitor for Google")
    click_button 'Create Monitor'
    page.should have_content('Monitor has been created.')
end

  it "cannot be created without a name" do
    visit '/'
    click_link 'New Monitor'
    click_button 'Create Monitor'
    page.should have_content("Monitor has not been created.")
    page.should have_content("Name can't be blank")
  end

  it "can be shown" do
    monitor = Factory.create(:monitor, :name => "Google")
    visit '/monitors'
    click_link 'All Monitors'
    click_link 'Google'
    page.current_url.should == monitor_url(monitor)
  end


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

  it "can be edited" do
     pending
  end

  it "can be deleted" do
     pending
  end

end
