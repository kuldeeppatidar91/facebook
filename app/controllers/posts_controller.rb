class PostsController < ApplicationController
	def create
	  # user = User.find(params[:user_id])
    user = current_user
	  post = user.posts.create(post_params)
	  if post.save
      render json: { post: PostSerializer.new(post)}
    else
      render json: {errors: user.errors.full_messages},status: :unprocessable_entity
    end
	end

	def destroy
    post = Post.find_by(id: params[:id])
    if post.user.id == current_user.id
     if post.present?
      if post.destroy
        render json: {message: 'post deleted succes'}, status: :ok
      else
        render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {errors: 'post not found'}, status: :not_found
      end
    end
   render json: {errors: 'you dont have access'}, status: :not_found
  end

  def update
  	post = Post.find_by(id: params[:id])
  	if post.user.id == current_user.id
  	  if post.present?
	  		if post.update(post_params)
	  			render json: post, status: :ok
	  		else
	  			 render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
  			end
  		else
  			render json: {errors: 'update not found'}
  		end
  	else
  		render json: {errors: 'you dont have access'}, status: :not_found
  	end
  end
	
  private

  def post_params
    params.require(:post).permit(:article,:image)
  end
end
