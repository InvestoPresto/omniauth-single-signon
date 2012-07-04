require "spec_helper"

describe OmniauthSingleSignon::SessionsController do
#Bug in rails assert_recognizes method
#This test stay now, Fix it later
  pending "routing" do
    it "routes to #new" do
      get("/signin").should route_to('omniauth_single_signon/sessions#new')
    end

    it "routes to #success" do
      get("/success").should route_to('sessions#success')
    end

    it "routes to #create" do
      post('/auth/investopresto/callback').should route_to('sessions#create', :provider => 'investopresto')
    end

    it "routes to #destroy" do
      get('/auth/signout/callback').should route_to('sessions#destroy')
    end
  end
end
