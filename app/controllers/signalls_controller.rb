class SignallsController < ApplicationController
	def index
		@signall = Vente.find(params[:vente_id]).signalls
	end
	def create
		# cree un signal pour un vente si ce dernier n est pas nil si non supprime le signal
		if (Signall.find_by(user: current_user, vente_id: params[:vente_id])==nil)
			@signal = Signall.new(user: current_user, vente_id: params[:vente_id])
			if @signal.save
				redirect_back fallback_location: '/' ,allow_other_host: false  #signal create
			else
				redirect_back fallback_location: '/' ,allow_other_host: false  #signal non create
			end			
		else
			Signall.find_by(user: current_user, vente_id: params[:vente_id]).destroy
			redirect_back fallback_location: '/' ,allow_other_host: false
		end



	end
end
