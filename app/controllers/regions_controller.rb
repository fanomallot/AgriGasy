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
end
