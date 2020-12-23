Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes
  resources :ingredients, only: %i[new create]
end
