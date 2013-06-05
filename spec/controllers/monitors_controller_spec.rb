require 'spec_helper'

describe MonitorsController do
  before do
    @user = FactoryGirl.create(:user)
    @monitor1 = FactoryGirl.create(:base_monitor)
    @monitor2 = FactoryGirl.create(:base_monitor)
    @monitor1.user = @user
    @monitor2.user = @user
    @monitor1.save
    @monitor2.save
    @user2 = FactoryGirl.create(:user)
    @monitor3 = FactoryGirl.create(:base_monitor)
    @monitor3.user = @user2
    @monitor3.save
  end

  describe "GET #index" do
    it "displays a monitor" do
      sign_in @user
      get :index
      assigns(:monitors).count.should eq 2
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      sign_in @user
      get :show, :id => @monitor1.id
      response.should render_template("show")
    end
  end

  describe "POST #create" do
    before do
      sign_in @user
    end
    context "with valid attributes" do
      it "saves the monitor in the database" do
        @monitor = PingMonitor.new(:hostname=>'Google.com')
        @monitor
      end
    end

    context "with invalid attributes" do
      it "does not save the monitor in the database" do
        @monitor = PingMonitor.new(:hostname=>' ')
        response.should redirect_to new_monitor_path
      end
    end
  end
end

