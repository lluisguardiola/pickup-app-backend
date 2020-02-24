Rails.application.routes.draw do

    resources :users, only: [:index, :create]
    
    post '/auth', to: 'auth#create'
    
	# get '/current_user', to: 'auth#show'
end