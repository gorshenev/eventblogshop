class EventsController < ApplicationController
	before_filter :get_event, :only => [:show, :edit, :update, :destroy]
	before_filter :get_latest_post, :get_new_product, :only => [:index, :show]

	def index
		@events = Event.all.order(time: :asc)
		get_event_days
	end

	def show
		
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
		
	end

	def update
		if @event.update_attributes(event_params)
			flash[:success] = "Event updated"
			redirect to event_path(@event)
		else
			flash[:error] = "There was an error updating that event"
			render action: :edit
		end
	end

	def destroy
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

		def get_event
			@event = Event.find(params[:id])
		end

		def get_event_days
			@event_days = []

			@events.each do |event|
				@event_days.push(event.time.to_date)
			end
		end

		def get_latest_post
			@latest_post = Post.all.order(created_at: :desc).first
		end

		def get_new_product
			@new_product = Product.all.order(created_at: :desc).first
		end
end