Rails.application.routes.draw do

    resources :users, only: [:index, :create]
    resources :events, only: [:index, :show]
    
    post '/auth', to: 'auth#create'
    
	# get '/current_user', to: 'auth#show'
end