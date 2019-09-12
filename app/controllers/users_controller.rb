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
		vente = @user.ventes.all
		vente.destroy_all
		achat = @user.achats.all
		achat.destroy_all
		@user.destroy
		redirect_to root_path
	end

  end
