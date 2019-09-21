class RegionsController < ApplicationController
	before_action :is_admins,only: [:destroy]

	def index
		@region = Region.all
	end

	def show
		@region = Region.find(params[:id])
	end

	def destroy
		@region = Region.find(params[:id])
		@vente = Vente.where(region: @region)
	  @vente.destroy_all
	  @achat = Achat.where(region: @region)
	  @achat.destroy_all
		@region.destroy
		flash[:success] = "Region supprimer!"
		redirect_to regions_path
	end

	private
	def is_admins
    if current_user.is_admin
      return true
    else 
      redirect_back fallback_location: '/' ,allow_other_host: false
    end
	end

end
