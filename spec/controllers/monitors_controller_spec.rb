require 'spec_helper'

describe MonitorsController do
  describe "GET #index" do
    it "assigns @monitor" do
      monitor = PingMonitor.create
      get :index
      assigns(:monitor).should eq([monitor])
    end

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      get :show
      response.should render_template("show")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the monitor in the database"
      it "redirects to the monitor index page"
    end

    context "with invalid attributes" do
      it "does not save the monitor in the database"
      it "re-renders the :new template"
    end
  end

end

