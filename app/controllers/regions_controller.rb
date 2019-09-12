class RegionsController < ApplicationController
	def index
		@region = Region.all
	end
	def show
		@region = Region.find(params[:id])
	end
end
