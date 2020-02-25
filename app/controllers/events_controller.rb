class EventsController < ApplicationController
	def index
		render json: Event.all
	end

	def show
		event = Event.find(params[:id])
		render json: event, include: [:game, :host, :attendees]
	end
end
