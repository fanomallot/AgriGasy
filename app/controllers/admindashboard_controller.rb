class AdmindashboardController < ApplicationController

	def vente
		@authenticatevente = Vente.all
	end

	def achat
		@authenticateachat = Achat.all
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

	def updateachat
		@id = params[:id]
		@achat = Achat.find(@id)
		if @achat.update(is_authenticate: true)
			redirect_to root_path
		else
			render "achat"
		end
	end

end
