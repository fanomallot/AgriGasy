class AdminsController < ApplicationController
	before_action :is_admins
	def index
		@admin = User.where(is_admin: true)
		@vente = Vente.where(is_authenticate: false)
		@achat = Achat.where(is_authenticate: false)
		@user = User.all
	end

	def update
		@id = params[:id]
		@user = User.find(@id)

		if @user.is_admin
			@user.update(is_admin: false)
			respond_to do |format|
	      		format.html{redirect_back fallback_location: '/' ,allow_other_host: false}
	      		format.js { }
	      	end
		else
			@user.update(is_admin: true)
			espond_to do |format|
	      		format.html{redirect_back fallback_location: '/' ,allow_other_host: false}
	      		format.js { }
	      	end
		end
	end
	private
	def is_admins
		if user_signed_in?
	      if current_user.is_admin
	        return true
	      else 
	        redirect_to "/accueils"
	      end
	 	else
	 		redirect_to "/accueils"
	 	end
    end

end
