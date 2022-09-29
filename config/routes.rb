Rails.application.routes.draw do
  devise_for :users, path: ''

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]

 # api routes
  namespace :api do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index], format: :json do
        resources :comments, only: [:index, :create], format: :json
      end
    end
  end

  root "users#index" 
end
