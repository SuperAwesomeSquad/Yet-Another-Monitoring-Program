require 'spec_helper'

describe "monitors", :type => :feature do

  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as!(@user)
    # @monitor = FactoryGirl.create(:monitor)
  end

  it "can be created" do
    visit '/monitors'
    click_link 'New Monitor'
    # raise page.html.to_s
    fill_in('Hostname', :with => 'Google.com')
    fill_in('Name', :with => 'Google')
    fill_in('Description', :with => "My ping monitor for Google")
    choose('700')
    click_button('Create Monitor')
    page.has_content?('Monitor has been created.')
  end

  it "cannot be created without a name" do
    visit '/'
    click_link 'New Monitor'
    click_button 'Create Monitor'
    page.has_content?("Monitor has not been created.")
    # page.should have_content("Name can't be blank")
  end

  it "can be shown" do
    visit '/monitors'
    click_link 'All Monitors'
    page.has_content?('Dashboard')
  end

  it "can be edited" do
    Factory(:monitor, :description => "Another Google monitor")
    visit "/"
    click_link "Google"
    click_link "Edit Monitor"
    fill_in "Name", :with => "My favorite Google monitor"
    click_button "Create Monitor"
    page.should have_content("Monitor has been updated.")
  end

  it "can be deleted" do
    # Factory(:monitor, :name => "Google")
    visit "/"
    click_link "Google"
    click_link "Delete Project"
    page.should have_content("Monitor has been deleted.")
    visit "/"
    page.should_not have_content("Google")
  #    visit '/monitors'
  #    click_link 'Google.com'
  #    click_link 'Delete Monitor'
  #    page.driver.browser.switch_to.alert.accept
  # end
  end

end
