class PostsController < ApplicationController
	before_action :authentication_required, only: [:new, :create, :update, :edit, :destroy]


	def index
	end

	def show
		@post = Post.find(params[:id])
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
		@markdown = Redcarpet::Markdown.new(renderer)
	end

	def new
		@post = Post.new
	end 

	def create
		@post = Post.create(post_params)
		redirect_to post_path(@post)
	end 

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
	end

	private

	def post_params
		params.require(:post).permit(:id, :title, :description, :content)
	end

end
