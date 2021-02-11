Rails.application.routes.draw do
  resources :movies
  resources :shows
  resources :netflixes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
