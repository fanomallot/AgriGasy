class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
    
    def edit
    	@user = User.find(params[:id])
	end 
	def update
        @user = User.find(params[:id])
		if @user.update(first_name: params[:first_name],
			last_name: params[:last_name],
			age: params[:age],
			ville: params[:ville],
			contact: params[:contact],
			description: params[:description])
			redirect_to user_path(@user.id)
		else
			render edit
		end
	end
	def destroy
		@user = User.find(params[:id])
		vente = Vente.where(user: @user)
		vente.destroy_all
		achat = Achat.where(user: @user)
		achat.destroy_all
		mp = MessagePrive.where(user: @user)
		mp.destroy_all
		signal = Signal.where(user: @user)
		signal.destroy_all
		@user.destroy
		redirect_to root_path
	end
end
