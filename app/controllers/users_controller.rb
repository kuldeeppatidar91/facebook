class UsersController < ApplicationController
	skip_before_action :authentication, only: [:create,:login,:index]
	def index
		@user = User.all
		render json: @user ,each_serializer: UserSerializer ,status: :ok
   end

  def create
    user = User.new(user_params)
		if user.save
			token = encode_user_data({ user_data: user.id })
      render json: { message: UserSerializer.new(user) , token: token}
    else
      render json: {errors: user.errors.full_messages},status: :unprocessable_entity
    end
	end

	def update
		user = User.find_by(id: params[:id])
    if user.id == current_user.id
		  if user.update(user_params)
			   render json: user, status: :ok
		  else
			 render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
		  end
    else
     render json: {message: 'you dont have access'},status: :not_found
   end
	end

    def destroy
      user = User.find_by(id: params[:id])
      if user.present?
       if user.destroy
          render json: {message: 'user deleted succes'}, status: :ok
        else
          render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render json: {errors: 'user not found'}, status: :not_found
      end
    end


  def login
    user = User.find_by(email:params[:user][:email])
    if user && user.valid?(params[:password])
      token = encode_user_data({ user_data: user.id })
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end

  private

	def user_params
		params.require(:user).permit(:first_name,:last_name,:mobile_number,:email, :date_of_birth,:gender,:work,:education,:address,:password)
	end
end



