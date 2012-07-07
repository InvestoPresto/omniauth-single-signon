class TestController < ApplicationController

  def index
    render :text => "Successfully signed out"
  end

  def success
    render :text => "Successfully signed in"
  end
end
