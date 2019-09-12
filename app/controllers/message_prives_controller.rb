class MessagePrivesController < ApplicationController
	def inex
	     @message_prive = Message_prive.all
	end
	def create
	     @message_prive = Message_prive.find(params[:id])
	  if @message_prive.create(content:params[:content])
	  	 redirect_to message_prive_path(@message_prive.id)
	  else
	  	render create
	  end
	end
	def show
		@message_prive = Message_prive.find(params[:id])
	end
end
