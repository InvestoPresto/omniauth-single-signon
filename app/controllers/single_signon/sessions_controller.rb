
module SingleSignon
  class SessionsController < ApplicationController
    def create
      session[:user_id] = User.find_or_create_by_omniauth request.env["omniauth.auth"]
      redirect_to single_signon.success_path(:redirect_uri => session[:user_return_to] || main_app.root_path), :notice => "Successfully signed in", :only_path => true
    end

    def success
      render :layout => false, :notice => 'Successfully signed in'
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.root_path, :notice => "Successfully signed out"
    end
  end
end
