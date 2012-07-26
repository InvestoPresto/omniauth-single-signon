Rails.application.routes.draw do

  match "/success" => "test#success", :as => :success
  match "/origin"  => 'test#origin', :as => :origin

  mount OmniauthSingleSignon::Engine => ""
  root :to => 'test#index'
end
