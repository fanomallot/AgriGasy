class MessagePrivesController < ApplicationController
	def index
	   #  @message_recue = MessagePrive.where(recipient: current_user)
	   #  @message_envoyE = MessagePrive.where(sender: current_user)
	   #  puts '*'*90
	   # puts @vente_user = params[:vente_user]
	   @mp =[]
	   	receveur = Vente.find(params[:vente_id]).user
	   	
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
		mp_trier_par_date= []

		puts '*'*90
		puts all_message
				#on fusion dans un tableau toutes les messages envoyées et recues
				#  puts '*'*90

				# puts MessagePrive.find(params[:id]).created_at

				# puts message_envoyE
				# puts '*'*90
				# k=0
				# for i in 0..(message_recue.length + message_envoyE.length-2)
				# 	if(message_recue.length>i)
				# 		all_message[k] = message_recue[i]
				# 		k+=1
				# 	end
				# 	if(message_envoyE.length>i)
				# 		all_message[k] = message_envoyE[i]
				# 		k+=1
				# 	end
				# end
			 puts 
			  
			 #  puts all_message
			 #    #triage par date de creation
			 #   nbr_de_msg = all_message.length
			 #   for i in 0..nbr_de_msg
			 #   	 max = all_message[0].created_at
			 #   	   for j in 1..all_message.length
			 #   	   		if max < all_message[i].created_at
			 #   	   			max = all_message[i].created_at
			 #   	   		else
			 #   	   			max = max 
			 #   	   		end
			 #   	   end

			 #   	   for k in 0..all_message.length
			 #   	   		if (all_message[k].created_at == max)
			 #   	   			all_message.delete_at(k)
			 #   	   			puts "deleted at  #{k}" 
			 #   	   			break
			 #   	   		end
			 #   	   end
			 #   	   mp_trier_par_date[i] = max
			 #   end 

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
