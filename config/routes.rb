Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      resources :users 
      resources :movies
      resources :reviews 
      resources :responses
      resources :movie_watches
      resources :baskets
      resources :chats
      post "/login", to: "auth#login"
      get "/fanfav", to: "movies#fan_fav"
      get "/mosttalkedabout", to: "movies#most_talked_about"
      get "/mostwatched", to: "movies#most_watched"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
