class EventsController < ApplicationController
	def index
		@events = Event.all.order(time: :asc)
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			flash[:success] = "New event created"
			redirect_to events_path
		else
			flash[:error] = "There was an error creating that event"
			render action: :new
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])

		if @event.update_attributes(event_params)
			flash[:success] = "Event updated"
			redirect to event_path(@event)
		else
			flash[:error] = "There was an error updating that event"
			render action: :edit
		end
	end

	def destroy
		@event = Event.find(params[:id])

		if @event.destroy
			flash[:success] = "Event deleted"
		else
			flash[:error] = "Event could not be deleted"
		end

		redirect_to events_path
	end

	private
		def event_params
			params.require(:event).permit(:name, :description, :time)
		end
end