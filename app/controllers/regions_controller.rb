class RegionsController < ApplicationController
	def index
		@regions = Region.all
	end
	def show
		puts "*"*95
		puts  params[:id]
		@region = Region.find(params[:id])
		@achats = Achat.where(region_id: @region.id)
		@ventes = Vente.where(region_id: @region.id)
	end

	def destroy
		@region = Region.find(params[:id])
		@region.destroy
		flash[:success] = "Region supprimer!"
		redirect_to regions_path
	end
end
