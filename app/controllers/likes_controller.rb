class LikesController < ApplicationController
	def create   
        object = if params[:post_id]
	                Post.find_by(id: params[:post_id])
	            else
	                Comment.find_by(id: params[:comment_id])
	            end
	    like =  object.likes.new

	    like.user = current_user

	    if like.save
            render json: { like: LikeSerializer.new(like)}
        else
            render json: {errors: like.errors.full_messages},status: :unprocessable_entity
        end
	end
	# def destroy
		
end
