class Post < ApplicationRecord
	has_one_attached :image
	belongs_to :user
	has_many :comments,as: :commentable,dependent: :destroy
	has_many :likes,as: :likeable,dependent: :destroy
end
