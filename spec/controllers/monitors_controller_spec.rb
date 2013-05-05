require 'spec_helper'

describe MonitorsController do
  describe "GET #index" do
    it "populates an array of monitors"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "renders the :show template"
  end

  describe "GET #new" do
    it "renders the :new template"
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
