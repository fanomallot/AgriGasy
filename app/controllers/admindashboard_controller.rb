class AdmindashboardController < ApplicationController

	def vente
		@authenticatevente = Vente.all
	end

	def achat
		@authenticateachat = Achat.where(is_authenticate: false)
	end

	def utilisateur
		@user = User.all
	end

	def updatevente
		@id = params[:id]
		@vente = Vente.find(@id)
		if @vente.update(is_authenticate: true)
			redirect_to root_path
		else
			render "vente"
		end
	end

end
