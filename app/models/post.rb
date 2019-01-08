class Post < ApplicationRecord

	validates :title, :description, :content, presence: true
end
