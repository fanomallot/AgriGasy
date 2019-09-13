class AvatarventesController < ApplicationController
	before_action :is_admis_or_current_user?
	def create
		@vente = Vente.find(params[:vente_id])
		@vente.avatarvente.attach(params[:avatarvente])
		redirect_to vente_path(@vente)	
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
