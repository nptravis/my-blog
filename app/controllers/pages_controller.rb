class PagesController < ApplicationController

	def index 
		@posts = Post.limit(7)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
		@markdown = Redcarpet::Markdown.new(renderer)
	end

	def about 
	end

end
