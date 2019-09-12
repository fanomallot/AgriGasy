class RegionsController < ApplicationController
	def index
		@region = Region.all
	end
	def show
		@region = Region.find(params[:id])
	end

	def destroy
		@region = Region.find(params[:id])
		@region.destroy
		flash[:success] = "Region supprimer!"
		redirect_to regions_path
	end
end
