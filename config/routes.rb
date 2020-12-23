Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    collection do 
      get 'search'
    end
  end
  resources :ingredients, only: %i[new create]
end
