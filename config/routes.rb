Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  	collection do 
  	  get :about
  	end
  end

  root to: 'posts#index'
end
