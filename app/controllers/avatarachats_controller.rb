class AvatarachatsController < ApplicationController
	before_action :is_admis_or_current_user?
	def create
		@achat = Achat.find(params[:achat_id])
		@achat.avatarachat.attach(params[:avatarachat])
		redirect_back fallback_location: '/' ,allow_other_host: false
	end
	private
    def is_admis_or_current_user?
	    @achat = Achat.find(params[:achat_id])
	    if current_user == @achat.user || current_user.is_admin
	      return true
	    else
	      redirect_back fallback_location: '/' ,allow_other_host: false
	    end
	end
end
