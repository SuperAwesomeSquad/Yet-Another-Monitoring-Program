require 'spec_helper'

describe DashboardController do
  before do
    @user = FactoryGirl.create(:user)
  end

	it "is visible" do
    sign_in @user
    get :index
    response.should render_template("index")
	end

end