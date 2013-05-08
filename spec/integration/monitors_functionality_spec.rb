require 'spec_helper'

describe "monitors", :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in_as!(@user)
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
    click_link '2'
    page.current_url.should == monitor_url(monitor)
  end

  it "can be edited" do
     pending
  end

  it "can be deleted" do
     pending
  end

end
