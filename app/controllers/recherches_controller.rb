class RecherchesController < ApplicationController
	def index
		@params = params[:find]
		@id = []
		@vente =[]
		@achat =[]
		@produit = Produit.where(['name LIKE ?',"%#{params[:find]}%"])
		@produit.each do |produit|
			@id << produit.id 
		end
		j=0
		k=0
		for i in 0..@id.length-1 do
			if (Vente.find_by(produit_id: @id[i])!=nil)
				@vente[j] = Vente.find_by(produit_id: @id[i])
				j+=1
			end
			if (Achat.find_by(produit_id: @id[i]) != nil)
				@achat[k] = Achat.find_by(produit_id: @id[i])
				k+=1
			end
		end	
	end
end
