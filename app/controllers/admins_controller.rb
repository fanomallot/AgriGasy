class AdminsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admins
	def index
		@admin = User.where(is_admin: true)
	end

	def update
		@id = params[:id]
		@user = User.find(@id)

		if @user.is_admin
			@user.update(is_admin: false)
			redirect_to user_path(@user.id)
		else
			@user.update(is_admin: true)
			redirect_to user_path(@user.id)
		end
	end
	private
	def is_admins
      if current_user.is_admin
        return true
      else 
        redirect_to "/accueils"
      end
    end

end
