Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }

  resources :posts do
    collection do
      get :about
    end

    member do
      get :publish
      get :unpublish
    end
  end

  root to: 'posts#index'
end
