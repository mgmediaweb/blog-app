Rails.application.routes.draw do
  devise_for :users, path: ''
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index" 
end
