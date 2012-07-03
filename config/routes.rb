SingleSignon::Engine.routes.draw do

  match "/signin" => "sessions#new", :as => :signin
  match "/success" => "sessions#success", :as => :success
  match "/auth/signout/callback" => "sessions#destroy"
  match "/auth/:provider/callback" => "sessions#create"

  get 'auth/signout', :as => :signout

end
