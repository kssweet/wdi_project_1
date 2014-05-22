Rails.application.routes.draw do

  root to: "news#index"


  get "sign_up", to: "users#new", as: "signup"
  get "log_in", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"


  resources :users
  resources :sessions

  resources :newsindex

end
