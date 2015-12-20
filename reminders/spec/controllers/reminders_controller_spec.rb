require 'rails_helper'


describe RemindersController, type: :controller do
	let(:user1) { create :user }

	context "when not authenticated" do
		it "responds with 302 (redirect user to login)" do
	    	get :index
	        expect(response).to have_http_status(302)
	    end
	end

	context "when authenticated" do
		it "responds with a 200 success status code" do
	    	sign_in user1
	    	get :index
	        expect(response).to have_http_status(200)
	    end
	end
end