class AdmindashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admins
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
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			render "vente"
		end
	end

	def updateachat
		@id = params[:id]
		@achat = Achat.find(@id)
		if @achat.update(is_authenticate: true)
			redirect_back fallback_location: '/' ,allow_other_host: false
		else
			render "achat"
		end
	end
	private
	def is_admins
      if current_user.is_admin
        return true
      else 
        redirect_to "/accueils"
      end
    end
end
