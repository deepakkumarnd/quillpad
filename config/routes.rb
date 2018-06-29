Rails.application.routes.draw do
  resources :posts do
  	collection do 
  	  get :about
  	end
  end

  root to: 'posts#index'
end
