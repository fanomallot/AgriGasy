class ProfilsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@user.profil.attach(params[:profil])
		redirect_to user_path(@user)
	end

end
