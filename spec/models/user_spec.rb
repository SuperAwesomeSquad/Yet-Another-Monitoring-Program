require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end
  it "Knows about its Monitors" do
    @user.respond_to?(:base_monitors).should eq true
  end
  it "Will convert itself to email when asked for to_s" do
    @user.to_s.should eq @user.email
  end
  it "Allows admin users to exist" do
    @user = FactoryGirl.create(:admin)
    @user.admin?.should eq true
  end
end
