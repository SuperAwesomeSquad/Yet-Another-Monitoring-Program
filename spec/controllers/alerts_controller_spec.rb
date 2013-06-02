require 'spec_helper'

describe AlertsController do
	describe "GET #index" do
		it "shows a user their active alerts if they exist"
		it "shows a user an all-clear if no alerts exist"
		it "Redirect a non-signed in user to root"
	end

	describe "GET #show" do
		it "shows an alert if a user is authorized to see it"
		it "redirects a non-authorised user to dashboard home"
		it "redirects a user requesting a non-exist user to dashboard home"
		it "allows a user to resolve alert"
		it "shows a user alert monitor"
		it "shows a user alert duration"
		it "shows a user alert start time"
		it "shows a user alert end time if alert is resolved"
		it "shows an alert is active"
		it "shows an alert is inactive"
	end
end