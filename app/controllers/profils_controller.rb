class ProfilsController < ApplicationController
	before_action :is_admis_or_current_user?
	def create
		@user = User.find(params[:user_id])
		@user.profil.attach(params[:profil])
		redirect_to user_path(@user)
	end
	private
	def is_admis_or_current_user?
		@user = User.find(params[:user_id])
		if current_user == @user || current_user.is_admin
			return true
		else
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end

end
