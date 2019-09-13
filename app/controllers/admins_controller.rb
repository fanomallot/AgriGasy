class AdminsController < ApplicationController

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

end
