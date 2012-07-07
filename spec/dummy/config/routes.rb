Rails.application.routes.draw do

  match "/success" => "test#success", :as => :success
  mount OmniauthSingleSignon::Engine => ""
  root :to => 'test#index'
end
