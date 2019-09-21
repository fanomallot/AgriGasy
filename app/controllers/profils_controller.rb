class ProfilsController < ApplicationController
	before_action :is_admis_or_current_user?
	def create

		# met a jour le profil de l'user
		@user = User.find(params[:user_id])
		if params[:profil] != nil
			@user.profil.attach(params[:profil])
    		flash[:success] = "La photo a été enregistré"
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			flash[:danger] = "Erreur de chargement de photo"
			redirect_to user_path(@user)
		end

	end
	private

	# test si @user est le current user ou admin
	def is_admis_or_current_user?
		@user = User.find(params[:user_id])
		if current_user == @user || current_user.is_admin
			return true
		else
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end

end
