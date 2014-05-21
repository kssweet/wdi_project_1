Rails.application.routes.draw do

get 'sessions/new'

get "sign_up" => "users#new", :as => "signup"
get "log_in" => "sessions#new", :as => "login"
get "logout" => "sessions#destroy", :as => "logout"

resources :users
resources :sessions

root :to =>"news#index"
resources :news

end
