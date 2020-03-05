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

	def show
		user = User.find(params[:id])
		
		if user.valid?
			render json: user.attended_events.to_json(include: :game)
		else
			render json: {error: 'User does not have any hosted events.'}
		end
	end

	def attend
		user = User.find(params[:user_id])
		event = Event.find(params[:event_id])

		if user.valid? && event.valid?
			attendance = user.attendances.find_by(event_id: event.id)
			#create new attendance instance and display active record error instead of string in else block
			if !attendance
				user.attended_events << event
				render json: {success: 'You were added to the attendance list.', user: user}
			else
				attendance.destroy
				render json: {error: 'You were removed from the attendance list.', user: user}
			end
		else
			render json: {error: 'No event found.'}
		end
	end
end
