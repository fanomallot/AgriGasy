class MessagePrivesController < ApplicationController
	def new
		# @message, un array contenant les messages du current_user et et l'usre ayant l'id params[:user_id]
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
		# creation d'un message avec l'id du recipient (envoie du message a un utilisateur specifié ) 
		@message = MessagePrive.create(sender_id:current_user.id, content:params[:content], recipient_id:params[:users_id], is_read:false)
		redirect_to new_user_message_prife_path(params[:users_id])
	end
	def search_user

		if params[:user1] != nil
			if params[:user1] == ""
				@user =[]
			else
				@user = User.where(['first_name LIKE ?',"%#{params[:user1]}%"]) + User.where(['last_name LIKE ?',"%#{params[:user1]}%"])
				@user = @user.uniq
				@user.each do |user|
					if current_user == user
						@user.delete(user)
					end
				end
			end
		end

	end 
	def create
		# creation d'un message avec un id du recepteur ( le current_user étant deja dans la page new message)
		@message = MessagePrive.create(sender_id:current_user.id, content:params[:content], recipient_id:params[:user_id], is_read:false)
		redirect_to new_user_message_prife_path(params[:user_id])
	end

	def show
	end
	def edit
	end

	def update
		# mise a jour de is_read du Message privé des que le recipient ou en occurence le current_user dès qu'il entre dans la page new ou marque le msg comme non lu
		MessagePrive.find(params[:id]).update(content: params[:content],is_read: params[:read?])
		if !params[:read?]
			redirect_to new_user_message_prife_path(params[:user_id])
		else
			redirect_to user_message_prives_path(params[:user_id])
		end
	end

	def destroy
		# suppression deu msg d l'utilisateur
		MessagePrive.find(params[:id]).destroy
		redirect_to  new_user_message_prife_path(params[:user_id])
	end
	def destroy_all
    message = MessagePrive.where('sender_id= :user AND recipient_id= :current OR sender_id= :current AND recipient_id= :user',user:params[:id], current:current_user.id )
    message.destroy_all
    redirect_to user_message_prives_path(current_user.id)
	end

	def sendmessage
		# recupère les utilisateurs dont le current user peut envoyer un msg
	end

end
