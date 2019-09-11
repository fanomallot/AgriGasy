class UsersController < ApplicationController
	def show
		@user = current_user
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
end
