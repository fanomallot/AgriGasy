class MessagepriveachatsController < ApplicationController
	def index
if current_user == Achat.find(params[:achat_id]).user
	 @message = []
		 @mp = []
		 id_u1 = []
		 id_u2 = []
		 @id_sender_recipient = []
		 
		# if current_user != achat.find(params[:achat_id])
			@mp = MessagePrive.where('recipient_id=:cu OR sender_id=:cu', cu: current_user.id)
			@mp.each do |m|
				if  m.recipient_id != current_user.id
					id_u1<< m.recipient_id
				end
			end
		
			@mp.each do |m|
				if  m.sender_id != current_user.id
					id_u2<< m.recipient_id
				end
			end

			@id_sender_recipient = id_u1 + id_u2
			@id_sender_recipient = @id_sender_recipient.uniq
			@id_sender_recipient.delete(current_user.id)
			@id_sender_recipient = @id_sender_recipient.compact
			puts "*"*90

			puts @id_sender_recipient
		 puts "*"*90
		
			@message =@mp
	else
		@message = []
		@mp = MessagePrive.where(recipient_id:current_user.id,sender_id:params[:user_id]) +	MessagePrive.where(recipient_id:params[:user_id],sender_id:current_user.id)
		puts "*"*90
		 @mp.each do |m|
		 	puts m.recipient.first_name
		 end

		for i in 0..@mp.length-1
				max = @mp[0]
				@mp.each do |m|
					if max.created_at < m.created_at
						max = m 
						
					else 
						max = max
					end
				end	
				@message << max
					@mp.delete(max)
			end	
		puts @message.length
	end	
		
	end
	def show
		 		@message = []
		@mp = MessagePrive.where(recipient_id:current_user.id,sender_id:params[:user_id]) +	MessagePrive.where(recipient_id:params[:user_id],sender_id:current_user.id)
		puts "*"*90
		for i in 0..@mp.length-1
				max = @mp[0]
				@mp.each do |m|
					if max.created_at < m.created_at
						max = m 
						
					else 
						max = max
					end
				end	
				@message << max
					@mp.delete(max)
			end	
		
	end

	def create
		if current_user == Achat.find(params[:achat_id]).user   		
			     message_prive = MessagePrive.new(content: params[:content], is_read: false)
			     message_prive.sender = current_user
			     puts params[:user_id]
			     puts User.find(params[:user_id])
			     message_prive.recipient = User.find(params[:user_id])
		        if message_prive.save
			   	 redirect_to "/users/#{params[:user_id]}/achats/#{params[:achat_id]}/messagepriveachats/#{ message_prive.id}"
			    else	
			   	 redirect_to "/users/#{params[:user_id]}/achats/#{params[:achat_id]}/messagepriveachats/#{ message_prive.id}"
			    end	
			else
				 message_prive = MessagePrive.new(content: params[:content], is_read: false)
			     message_prive.sender = current_user
			     message_prive.recipient = Achat.find(params[:achat_id]).user
		        if message_prive.save
			   	 redirect_to user_achat_messagepriveachats_path(Achat.find(params[:achat_id]).user.id, params[:achat_id])
			    else
			   	 redirect_to user_achat_messagepriveachats_path(Achat.find(params[:achat_id]).user.id, params[:achat_id])
			    end	
			end   		
	end

	def edit
		@messagePrive = MessagePrive.find(params[:id])
	end
	def update
		puts "*"*90
		@messagePrive = MessagePrive.find(params[:id])
	    @messagePrive.update(content: params[:content])
		if current_user == Achat.find(params[:achat_id]).user
			redirect_to user_achat_messagepriveachat_path(params[:user_id],params[:achat_id],params[:id])
		else
			redirect_to user_achat_messagepriveachats_path(params[:user_id], params[:achat_id])
		end
	end
	def destroy
		MessagePrive.find(params[:id]).destroy
		redirect_to user_achat_messagepriveachats_path(current_user.id, params[:achat_id])
	end
end
