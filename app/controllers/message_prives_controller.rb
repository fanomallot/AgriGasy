class MessagePrivesController < ApplicationController
	def new
		puts '*'*90
		@messages = MessagePrive.where('sender_id = :u AND recipient_id = :cu OR sender_id = :cu AND recipient_id = :u', cu:current_user.id, u:params[:user_id]).order(created_at: :asc)
	end
	def index
	#@message array contenant les discussions du current_user et l'autre user
		@message = []
		@recipient_id = []
		@sender_id = []
		@id_sender_recipient = []
		message = MessagePrive.where('sender_id = :cu OR recipient_id = :cu', cu: current_user)
		 #recherche (comptage) id des utilisateurs que le current_user à envoyé ou a recu des msg
		 message.each do |m1|
		 		@recipient_id << m1.recipient.id
		 		@sender_id << m1.sender.id
		 end
		  @message = @recipient_id + @sender_id
		  @message = @message.uniq
		  @message.each do |m|
		  	 if m!=current_user.id
		  	 	@id_sender_recipient << m
		  	 end
		  end
		@id_sender_recipient = @id_sender_recipient.uniq
	end
	def create
		puts '*'*90
		puts params[:user_id]
		MessagePrive.create(sender_id:current_user.id, content:params[:content], recipient_id:params[:user_id], is_read:false)
		redirect_to new_user_message_prife_path(params[:user_id])
	end

	def show
	end
	def edit
	end

	def update
		MessagePrive.find(params[:id]).update(content: params[:content])
		redirect_to new_user_message_prife_path(params[:user_id])
	end

	def destroy
		MessagePrive.find(params[:id]).destroy
		redirect_to  new_user_message_prife_path(params[:user_id])
	end
end
