class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admis_or_current_user?,except:[:show]
	before_action :is_admis,only: [:destroy]
	def userachat
		# recupere l'achat de l'user autentifier et non authentifier dans les  tab @achat_authentifie/@achat_unauthentifie 
		@achat_authentifie = []
		@achat_unauthentifie = []
		@user = User.find(params[:id])
		@user.achats.each do |achat|
			if achat.is_authenticate
				@achat_authentifie << achat
			else
				@achat_unauthentifie << achat
			end
		end
	end
	def uservente
		# recupere l'vente de l'user autentifier et non authentifier dans les  tab @vente_authentifie/@vente_unauthentifie
		@vente_authentifie = []
		@vente_unauthentifie = []
		@user = User.find(params[:id])
		@user.ventes.each do |vente|
		if vente.is_authenticate
			@vente_authentifie << vente
		else
			@vente_unauthentifie << vente
		end
	end
	end
	def show
		@user = User.find(params[:id])
	end
    
    def edit
    	@user = User.find(params[:id])
	end 
	def update
		# met à jour les info concernant l'current_user
        @user = User.find(params[:id])
        if current_user == User.first
        	@user.is_admin = true
        end
		if @user.update(first_name: params[:first_name],
			last_name: params[:last_name],
			age: params[:age],
			ville: params[:ville],
			contact: params[:contact],
			description: params[:description])
			flash[:success] = "Modification enregistré"
			redirect_to user_path(@user.id)
		else
			flash[:danger] = "Erreur modification"
			render edit
		end
	end
	def destroy

		# supprime tous les ventes et achats de l'user puis l'user
		@user = User.find(params[:id])
		vente = Vente.where(user: @user)
		vente.destroy_all
		achat = Achat.where(user: @user)
		achat.destroy_all
		mp = MessagePrive.where(user: @user)
		mp.destroy_all
		signal = Signal.where(user: @user)
		signal.destroy_all
		@user.destroy
		redirect_to root_path
	end
	private
	def is_admis_or_current_user?
		@user = User.find(params[:id])
		if current_user == @user || current_user.is_admin
			return true
		else
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end
	def is_admins
      if current_user.is_admin
        return true
      else 
        redirect_back fallback_location: '/' ,allow_other_host: false
      end
    end
end
