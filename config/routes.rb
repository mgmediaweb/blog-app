Rails.application.routes.draw do
  devise_for :users, defaults: { format: :html },
                         controllers: {
                         sessions: 'users/sessions'
                        }

  get 'sign_in', to: 'users/sessions#new'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]

  namespace :api, :defaults => {:format => :json} do
      #post '/auth/login', to: 'authentication#login'
      resources :users, only:[:index, :show, :create] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"
end
