class AvatarventesController < ApplicationController
	before_action :is_admis_or_current_user?
	def create
		@vente = Vente.find(params[:vente_id])
		if params[:avatarvente]!= nil
			@vente.avatarvente.attach(params[:avatarvente])
			flash[:success] = "La photo a été enregistré"
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			flash[:danger] = "Erreur de chargement de photo"
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end
	private
    def is_admis_or_current_user?
	    @vente = Vente.find(params[:vente_id])
	    if current_user == @vente.user || current_user.is_admin
	      return true
	    else
	      redirect_back fallback_location: '/' ,allow_other_host: false
	    end
	end

end
