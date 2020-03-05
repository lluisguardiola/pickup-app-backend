class EventsController < ApplicationController
	def index
		events = Event.all.sort_by {|event| event.created_at}.reverse.first(12)
		render json: events, include: :game
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

	def update
		event = Event.find(params[:id])
		if event.valid?
			event.update(event_params)
			render json: event, include: :game
		else
			render json: {error: 'Event could not be updated.'}
		end
	end

	def destroy
		event = Event.find(params[:id])
		if event.valid?
			event.destroy
			render json: event
		else
			render json: {error: 'Event could not be deleted.'}
		end
	end

	private

	def event_params
		params.require(:event).permit(:user_id, :title, :description, :game_id, :address, :time, :date)
	end
end
