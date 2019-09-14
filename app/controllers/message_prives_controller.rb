class MessagePrivesController < ApplicationController
	def index
	   #  @message_recue = MessagePrive.where(recipient: current_user)
	   #  @message_envoyE = MessagePrive.where(sender: current_user)
	   #  puts '*'*90
	   # puts @vente_user = params[:vente_user]
	    	 	 receveur = Vente.find(params[:vente_id]).user
	   @mp =[]
	   	
	   	
		if (MessagePrive.find_by(sender: current_user, recipient: receveur )!=nil && MessagePrive.find_by(sender:receveur  , recipient: current_user)!=nil)
			
			message_recue = MessagePrive.where(sender: receveur , recipient: current_user )
			message_envoyE = MessagePrive.where(sender: current_user, recipient:receveur )
		@message =message_recue+message_envoyE
			puts "*"*90
			puts  "1"
			max = @message[0]
			@message.each do |m|
				if max.created_at < m.created_at
					max = m 
					
				else 
					max = max
				
				end
				@mp << max
				

			end	
						
			@message = @mp
			elsif (MessagePrive.where(sender: current_user, recipient: receveur ).length != 0) 
			puts "*"*90
			puts  "2"
				@message =  MessagePrive.where(sender: current_user, recipient:receveur ).order(created_at: :asc)
		else
						puts "*"*90
			puts  "3"
			@message =  MessagePrive.where(sender:receveur , recipient:current_user).order(created_at: :asc)
		end
	
	end

	def show

	end

	def create	   		
		     message_prive = MessagePrive.new(content: params[:content])
		     message_prive.sender = current_user
		     message_prive.recipient = Vente.find(params[:vente_id]).user
	        if message_prive.save
		   	 redirect_to user_vente_message_prives_path(current_user.id, params[:vente_id])
		    else
		   	 redirect_to user_vente_message_prives_path(current_user.id, params[:vente_id])
		    end	   	
	end
	def edit
		@messagePrive = MessagePrive.find(params[:id])
	end
	def update
		puts "*"*90
		@messagePrive = MessagePrive.find(params[:id])
	    @messagePrive.update(content: params[:content])
		redirect_to user_vente_message_prives_path(current_user.id, params[:vente_id])
	end
	def destroy
		MessagePrive.find(params[:id]).destroy
		redirect_to user_vente_message_prives_path(current_user.id, params[:vente_id])
	end
end
