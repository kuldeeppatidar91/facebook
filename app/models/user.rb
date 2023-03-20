class User < ApplicationRecord
has_many :posts,dependent: :destroy
has_many :comments,dependent: :destroy
has_many :likes,dependent: :destroy
has_many :friendships,dependent: :destroy
has_many :friends, through: :friendships,dependent: :destroy


has_many :senders    

has_many :receivers


validates :last_name,:first_name,:mobile_number,:email,:education,:password,:date_of_birth,:gender,presence: true
validates :email,uniqueness: true,on: :create
validates :work,:address,presence: true,allow_blank: true
validates :password,length:{in: 6..8}
validates :mobile_number,length:{in: 10..10}
end
