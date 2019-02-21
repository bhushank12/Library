Rails.application.routes.draw do
  resources :csv_imports
  get 'libraries/:library_id/users', to: 'users#index_for_library_users', as: 'library_users'
  root 'users#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :libraries do
  	resources :books do 
  		resources :book_copies do
  			resources :order_details
  		end
      resources :order_details
  	end
    resources :users do 
      resources :order_details
    end
	end  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
