class AvatarachatsController < ApplicationController

	def create
		@achat = Achat.find(params[:achat_id])
		@achat.avatarachat.attach(params[:avatarachat])
		redirect_to achat_path(@achat)
	end
end
