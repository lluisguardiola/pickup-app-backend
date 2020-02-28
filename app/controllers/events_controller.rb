class EventsController < ApplicationController
	def index
		render json: Event.all, include: :game
	end

	def show
		event = Event.find(params[:id])
		render json: event, include: [:game, :host, :attendees]
	end

	def create
		event = Event.new(event_params)

		if event.valid?
			event.save
			user = User.find(event_params[:user_id])
			user.attended_events << event

			render json: event, include: :game
		else
			render json: {error: 'Event could not be created.'}
		end
	end

	private

	def event_params
		params.require(:event).permit(:user_id, :title, :description, :game_id, :address, :time, :date)
	end
end
