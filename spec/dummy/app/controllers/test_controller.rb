class TestController < ApplicationController

  def index
    render :text => "Successfully signed out"
  end

  def origin
    render :text => "Successfully signed in"
  end

  def success
    if session[:user_return_to]
      redirect_to session[:user_return_to]
    else
      render :text => "Successfully signed in"
    end
  end
end
