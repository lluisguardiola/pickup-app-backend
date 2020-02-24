class UsersController < ApplicationController
  def index
	render json: User.all
  end

  def create
	user = User.new(
		username: params[:username],
		password: params[:password], 
		name: params[:name], 
		age: params[:age].to_i, 
		city: params[:city]
	)

	if user.valid?
	  user.save
	  render json: user
	else
	  render json: {error: 'User could not be created.'}
	end
  end
end
