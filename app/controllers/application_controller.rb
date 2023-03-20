class ApplicationController < ActionController::API
	 # include AbstractController::Layouts
   SECRET = "yoursecretword"
	 before_action :authentication

  def authentication
  	
      byebug
    decode_data = decode_user_data(request.headers["token"])
     # byebug
    user_data = decode_data[0]["user_data"] unless !decode_data
    user = User.find_by(id: user_data)
  
    if user.present?
      return true
    else
      return render json: { message: "invalid credentials" }
    end
  end


  def current_user
    # byebug
    return if request.headers["token"].blank?
  	decode_data = decode_user_data(request.headers["token"])
    user_data = decode_data[0]["user_data"] unless !decode_data
    # byebug
     User.find(user_data)
  end


   
  # turn user data (payload) to an encrypted string  [ A ]
  def encode_user_data(payload)
    byebug
    JWT.encode payload, SECRET, "HS256"      #payload me user id aati he 
  
  end


  # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
  def decode_user_data(token)
  	# byebug
    begin
      data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
      return data
    rescue => e
      puts e
    end
  end
end
