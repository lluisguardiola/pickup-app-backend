Rails.application.routes.draw do

    resources :users, only: [:index, :create, :show]
    # get '/users/:id/hosted_events', to: 'users#hosted'
    # get '/users/:id/attended_events', to: 'users#attended' 
    
    resources :events, only: [:index, :show, :create]
    
    resources :games, only: [:index, :create]

    post '/auth', to: 'auth#create'
    
	# get '/current_user', to: 'auth#show'
end