class PagesController < ApplicationController

	def index 
		@posts = Post.limit(7)
	end

	def about 
	end

end
