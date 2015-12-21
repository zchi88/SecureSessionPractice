require 'rails_helper'


describe RemindersController, type: :controller do
	# Make sure that trying to use the site without logging in as a user redirects to the login page
	context "when not authenticated" do
		it "responds with 302 (redirect user to login)" do
	    	get :index
	        expect(response).to have_http_status(302)
	        expect(response).to redirect_to("http://test.host/users/sign_in")
	    end
	end


	# Make sure that when signed in, users can see reminders belonging to themselves, but not to other users.
	context "when authenticated" do
		before(:each) do
			# Create user1 and set a reminder belonging to user1
			user1 = create(:user,  email: "user1@test.com")
			reminder1 = create(:reminder, user_id: user1.id)

			# Create a second user, user2, and a reminder for user2, then sign in as user 2
			user2 = create(:user,  email: "user2@test.com")
			reminder2 = create(:reminder, user_id: user2.id)
			sign_in(user2)
		end

		# # Create user1 and set a reminder belonging to user1
		# let(:user1) { create :user,  email: "user1@test.com"}
		# let(:reminder1) { create :reminder, user_id: user1.id}

		# # Create a second user, user2, and a reminder for user2
		# let(:user2) { create :user,  email: "user2@test.com", id: user1.id + 1}
		# let(:reminder2) { create :reminder, user_id: user2.id, id: reminder1.id + 1}


		it "responds with a 200 success status code when accessing own reminders" do
	    	get :show, :id => "2"
	        expect(response).to have_http_status(200)

	    end

		it "responds with a 401 unauthorized status code when accessing other's reminders" do
	    	get :show, :id => "1"
	        expect(response).to have_http_status(401)
	    end


	end
end