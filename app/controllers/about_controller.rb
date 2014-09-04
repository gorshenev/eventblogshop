class AboutController < ApplicationController
	before_filter :get_upcoming_event, :get_latest_post, :get_new_product

	def about

	end

	def contact

	end

	private
		def get_latest_post
			@latest_post = Post.all.order(created_at: :desc).first
		end

		def get_upcoming_event
			@upcoming_event = Event.all.order(time: :asc).first
		end
		
		def get_new_product
			@new_product = Product.all.order(created_at: :desc).first
		end
end