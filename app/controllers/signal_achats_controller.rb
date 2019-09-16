class SignalAchatsController < ApplicationController

	def index
		@signalAchat = Achat.find(params[:achat_id]).signal_achats
	end

	def create
		if (SignalAchat.find_by(user: current_user, achat_id: params[:achat_id])==nil)
			@signal = SignalAchat.new(user: current_user, achat_id: params[:achat_id])
			if @signal.save
				redirect_back fallback_location: '/' ,allow_other_host: false  #signal create
			else
				redirect_back fallback_location: '/' ,allow_other_host: false  #signal non create
			end			
		else
			SignalAchat.find_by(user: current_user, achat_id: params[:achat_id]).destroy
			redirect_back fallback_location: '/' ,allow_other_host: false
		end
	end
end
