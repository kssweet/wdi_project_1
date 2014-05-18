Rails.application.routes.draw do

 root to: "home/#index"

get "/news" => "news#index"

end
