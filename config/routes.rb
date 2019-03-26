Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }

  resources :posts do
    collection do
      post :search
    end

    member do
      get :publish
      get :unpublish
    end
  end

  resource :profiles, only: [:edit, :update]

  get 'about', to: 'posts#about'

  root to: 'posts#index'
end
