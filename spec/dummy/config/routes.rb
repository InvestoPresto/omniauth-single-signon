Rails.application.routes.draw do

  mount OmniauthSingleSignon::Engine => ""
  root :to => 'test#index'
end
