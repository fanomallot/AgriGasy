class MessagePrivesController < ApplicationController
	def index
	     @message_prive = MessagePrive.all
	end
	def create
	     @message_prive = MessagePrive.new(
	     	content: params[:content])
	     @message_prive.sender = current_user
	     @message_prive.recipient = User.find(params[:user_id])

	  if @message_prive.save
	  	 redirect_to user_message_prives_path(params[:user_id])
	  else
	  	render create
	  end
	end
	def show
		@message_prive = MessagePrive.find(params[:id])
	end
end
