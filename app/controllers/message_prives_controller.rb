class MessagePrivesController < ApplicationController
	def new
		@id = params[:user_id]
		@messages = MessagePrive.where('sender_id = :u AND recipient_id = :cu OR sender_id = :cu AND recipient_id = :u', cu:current_user.id, u:params[:user_id]).order(created_at: :asc)
		# dès que le recepteur ouvre la page new on  set is_read à true de ladernière messages
		if @messages.length != 0
			if (current_user == @messages.last.recipient)
				@messages.each do |message|
					message.update(is_read: true)
				end
			end	
		end
	end
	def index
	# id_sender_recipient, un array contenant les ids des users qui ont discuté avec le current_user
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

	def sendingmessage
		MessagePrive.create(sender_id:current_user.id, content:params[:content], recipient_id:params[:users_id], is_read:false)
		redirect_to new_user_message_prife_path(params[:users_id])
	end
	def create
		 	puts params[:users_id]
				MessagePrive.create(sender_id:current_user.id, content:params[:content], recipient_id:params[:user_id], is_read:false)
				redirect_to new_user_message_prife_path(params[:user_id])
	end

	def show
	end
	def edit
	end

	def update
		MessagePrive.find(params[:id]).update(content: params[:content],is_read: params[:read?])
		if !params[:read?]
			redirect_to new_user_message_prife_path(params[:user_id])
		else
			redirect_to user_message_prives_path(params[:user_id])
		end
	end

	def destroy
		MessagePrive.find(params[:id]).destroy
		redirect_to  new_user_message_prife_path(params[:user_id])
	end

	def sendmessage

		@users=[]
		@users = User.all
		 
	end
end
