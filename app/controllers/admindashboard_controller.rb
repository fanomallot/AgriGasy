class AdmindashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admins
	def vente
		# liste de vente
		@authenticatevente = Vente.all
	end

	def achat
		# liste de achat
		@authenticateachat = Achat.all
	end

	def utilisateur
		# liste de tous les users
		@user = User.all
	end

	def updatevente
		# met true l 'is_authenticate du vente si ce dernier est false, false si non
		@id = params[:id]
		@vente = Vente.find(@id)
		if @vente.update(is_authenticate: true)
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			render "vente"
		end
	end

	def updateachat
		# met true l 'is_authenticate du achat si ce dernier est false, false si non
		@id = params[:id]
		@achat = Achat.find(@id)
		if @achat.update(is_authenticate: true)
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			render "achat"
		end
	end
	private

	# methode testant le current_user s'il est un administrateur
	def is_admins
      if current_user.is_admin
        return true
      else 
        redirect_to "/accueils"
      end
    end
end
