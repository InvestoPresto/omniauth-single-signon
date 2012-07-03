Rails.application.routes.draw do

  mount SingleSignon::Engine => ""
  root :to => 'test#index'
end
