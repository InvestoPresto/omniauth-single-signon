module OmniauthSingleSignon
  class SessionsController < ApplicationController
    def create
      user                     = User.find_or_create_by_omniauth(request.env["omniauth.auth"])
      session[:user_id]        = user.id
      session[:user_return_to] = request.env['omniauth.origin'] if request.env['omniauth.origin']
      flash[:profile]          = profile_info
      redirect_to main_app.success_path(:sign_up => user.sign_up), :notice => "Successfully signed in", :only_path => true
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.root_path, :notice => "Successfully signed out"
    end

    private
      def profile_info
        @profile_info ||= begin
          omniauth_info                   = request.env['omniauth.auth'][:info]
          profile_hash                    = omniauth_info.extract!(:name, :location)
          profile_hash[:remote_image_url] = omniauth_info[:image]
          profile_hash
        end
      end
  end
end
