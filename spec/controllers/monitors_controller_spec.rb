require 'spec_helper'

describe MonitorsController do
  describe "GET #index" do
    it "populates an array of monitors"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested contact to @contact"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Contact to @contact"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end
end
