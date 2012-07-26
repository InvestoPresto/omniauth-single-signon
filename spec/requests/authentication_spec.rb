require 'spec_helper'

describe "Authentication" do
  context "not_logged_in_user" do
    it "should sign in using investopresto oauth2" do
      visit '/auth/single_signon'
      page.should have_content 'Successfully signed in'
    end

    it "should redirect to origin" do
      visit "/auth/single_signon?origin=#{main_app.origin_path}"
      current_path.should eq main_app.origin_path
    end
  end

  context "while logged in" do
    include_context "logged in user"

    it "should logout and go to homepage when the user signed out" do
    	visit omniauth_single_signon.signout_path
      page.should have_content 'Successfully signed out'
    end
  end
end
