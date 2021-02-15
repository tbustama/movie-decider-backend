Rails.application.routes.draw do
  resources :likes
  resources :movies
  resources :shows
  resources :users
  post '/signin', to: 'users#signin'
  # resources :netflixes
  namespace :api do
    namespace :v1 do
      # resources :users, only: [:create]
      post '/signup', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/persist', to: 'auth#show'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
