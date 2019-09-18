class AvatarachatsController < ApplicationController
	before_action :is_admis_or_current_user?
	def create
		@achat = Achat.find(params[:achat_id])
		if params[:avatarachat] != nil
			@achat.avatarachat.attach(params[:avatarachat])
			flash[:success] = "La photo a été enregistré"
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			flash[:danger] = "Erreur de chargement de photo"
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end
	private
    def is_admis_or_current_user?
	    @achat = Achat.find(params[:achat_id])
	    if current_user == @achat.user || current_user.is_admin
	      return true
	    else
	      redirect_back fallback_location: '/' ,allow_other_host: false
	    end
	end
end
