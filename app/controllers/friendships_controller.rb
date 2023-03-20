class FriendshipsController < ApplicationController
    before_action :authentication
	def index
      # byebug
      @friendship = Friendship.all
       render json: @friendship 
     end  
     def create
         # byebug
        @user = current_user.friendships.new(friend_id: params[:user_id],requester_id: current_user.id)
        @friendship = Friendship.new(user_id: params[:friend_id], friend_id: params[:friend_id], requester_id: current_user.id )
        
      
        if @friendship.save && @user.save
           render json: @friendship
       else 
          render json: @friendship.errors  
        end 
     end
     def update
         # byebug
      @friendship= Friendship.find_by(id: params[:id])
      @friendship.update(status: true)
      render json: @friendship
   end
 end
