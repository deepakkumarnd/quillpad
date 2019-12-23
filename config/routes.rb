require 'subdomain'

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }

  resources :posts do
    resources :comments, only: [:create, :destroy]

    collection do
      post :search
    end

    member do
      get :publish
      get :unpublish
    end
  end

  resource :profiles, only: [:show, :edit, :update]
  resources :blogs, only: [:index, :show]

  get 'about', to: 'blogs#about'
  get 'status', controller: 'application', action: 'status'

  # subdomain based access
  constraints(Subdomain) do
    match '/' => 'blogs#index', via: [:get]
  end

  root to: 'pages#index'
end
