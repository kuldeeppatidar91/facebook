class MessagesController < ApplicationController

    def create 
       message = Message.create(sender_id: current_user.id, receiver_id: params[:receiver_id], text: params[:message])
       render json: message
    end 
    def destroy
      # byebug
      message = Message.find_by(id: params[:id])
      if message.sender.id == current_user.id
         if message.present?
         if message.destroy
            render json: {message: 'message delete succes'},status: :ok
         else
            render json: { erroes: message.errors.full_messages},status: :unprocessable_entity
         end
      else
         render json: {message: 'message not found'},status: :not_found
      end
      else
         render json: {message: ' you dont have access'},status: :not_found
      end

   end

end
