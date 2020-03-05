Rails.application.routes.draw do

    resources :users, only: [:index, :create, :show]
    post '/users/attend', to: 'users#attend' 
    
    resources :events, only: [:index, :show, :create, :update, :destroy]
    
    resources :games, only: [:index, :create]

    post '/auth', to: 'auth#create'
    
	# get '/current_user', to: 'auth#show'
end