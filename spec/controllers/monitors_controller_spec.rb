require 'spec_helper'

describe MonitorsController do
  before do
    @user = FactoryGirl.create(:user)
    @monitor1 = FactoryGirl.create(:base_monitor)
    @monitor2 = FactoryGirl.create(:base_monitor)
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
        @monitor
        response.should render_template("new")
      end
    end
  end
end

