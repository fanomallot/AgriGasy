class AdmindashboardController < ApplicationController

	def vente
		@authenticatevente = Vente.where(is_authenticate: false)
	end

	def achat
		@authenticateachat = Achat.where(is_authenticate: false)
	end

	def utilisateur
		@user = User.all
	end

end
