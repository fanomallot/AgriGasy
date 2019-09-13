class AvatarventesController < ApplicationController

	def create
		@vente = Vente.find(params[:vente_id])
		@vente.avatarvente.attach(params[:avatarvente])
		redirect_to vente_path(@vente)	
	end

end
