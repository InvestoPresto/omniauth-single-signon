module OmniauthSingleSignon
  class SessionsController < ApplicationController
    def create
      session[:user_id] = User.find_or_create_by_omniauth(request.env["omniauth.auth"]).id
      session[:user_return_to] = request.env['omniauth.origin'] if request.env['omniauth.origin']
      redirect_to main_app.success_path, :notice => "Successfully signed in", :only_path => true
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.root_path, :notice => "Successfully signed out"
    end
  end
end
