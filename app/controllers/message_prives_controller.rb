class MessagePrivesController < ApplicationController
	def index
	    @message_prive = MessagePrive.all
	end
	def create
	    @messagePrive = MessagePrive.new(content:params[:content])
	    @messagePrive.sender = current_user
	    @messagePrive.recipient = User.find(params[:user_id])
	   @messagePrive.save
	    redirect_to user_message_prives_path(params[:user_id] )
	   #else 
	#	render create
     #  end
	end


	   def edit
		  @messagePrive = MessagePrive.find(params[:id])
	   end
	  def update
		  puts "*"*90
		  @messagePrive = MessagePrive.find(params[:id])
	      @messagePrive.update(content: params[:content])
		  redirect_to user_message_prives_path(@messagePrive.sender.id)
	 end

	def destroy
		 @messagePrive = MessagePrive.find(params[:id])
		 @messagePrive.destroy
		 redirect_to root_path
		
	end
end
