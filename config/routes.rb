OmniauthSingleSignon::Engine.routes.draw do

  match "/auth/signout/callback" => "sessions#destroy"
  match "/auth/:provider/callback" => "sessions#create"

  get 'auth/signout', :as => :signout

end
