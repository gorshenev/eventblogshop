class PostsController < ApplicationController
	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			flash[:success] = "New post created"
			redirect_to posts_path
		else
			flash[:error] = "There was an error creating that post"
			render action: :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			flash[:success] = "Post updated"
			redirect_to post_path(@post)
		else
			flash[:error] = "There was an error updating that post"
			render action: :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			flash[:success] = "Post deleted"
		else
			flash[:error] = "Post could not be deleted"
		end

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end