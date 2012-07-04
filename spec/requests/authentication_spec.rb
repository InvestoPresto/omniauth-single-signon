require 'spec_helper'

describe "Authentication" do
  it "should sign in using investopresto oauth2" do
    visit '/auth/single_signon'
    page.should have_content 'Successfully signed in'
  end

  context "while logged in" do
    include_context "logged in user"

    it "should logout and go to homepage when the user signed out" do
    	visit omniauth_single_signon.signout_path
      page.should have_content 'Successfully signed out'
    end
  end
end
