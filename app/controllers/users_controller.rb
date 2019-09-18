class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admis_or_current_user?,except:[:show]
	before_action :is_admis,only: [:destroy]
	def show
		@user = User.find(params[:id])
	end
    
    def edit
    	@user = User.find(params[:id])
	end 
	def update
        @user = User.find(params[:id])
        if current_user == User.first
        	@user.is_admin = true
        else
        	@user.is_admin = false
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
