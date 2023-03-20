class CommentsController < ApplicationController
	def create   

    # post = Post.find_by(params[params[:id]])
	  # post = Post.find_by(params[:post_id])
	  # comment.find_by(id)
	  # comment.post()
    object = if params[:post_id]
				        Post.find_by(id: params[:post_id])
				      else
				       	Comment.find_by(id: params[:comment_id])
				      end
	  # byebug
	  comment =  object.comments.new(comment_params)
	  # comment =  post.comments.comment.new(comment_params)
    comment.user = current_user

	  if comment.save
      render json: { comment: CommentSerializer.new(comment)}
    else
      render json: {errors: comment.errors.full_messages},status: :unprocessable_entity
    end
	end

	def destroy
		comment = Comment.find_by(id: params[:id])
		if comment.user.id == current_user.id
			if comment.present?
			if comment.destroy
				# render json: comment,status: :ok
				 render json: {message: 'post deleted succes'}, status: :ok
			else
				render json: {errors: comment.errors.full_messages},status: :unprocessable_entity
			end
		else
			render json: {message: 'comment not found'},status: :not_found
			end
		else
			render json: {message:'you dont have access'},status: :not_found
		end
	end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
