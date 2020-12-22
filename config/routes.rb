Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes, only: %i[index new create]
  resources :ingredients, only: %i[new create]
end
