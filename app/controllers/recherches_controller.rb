class RecherchesController < ApplicationController
	def index
		@params = params[:find]
		@id_produit = []
		@id_region = []
		@vente =[]
		@achat =[]	
		@vente2 =[]
		@achat2 =[]
		@produit = Produit.where(['name LIKE ?',"%#{params[:find]}%"])
		@produit.each do |produit|
			@id_produit << produit.id 
		end
		j=0
		k=0
		for i in 0..@id_produit.length-1 do
			if (Vente.find_by(produit_id: @id_produit[i])!=nil)
				@vente[j] = Vente.find_by(produit_id: @id_produit[i])
				j+=1
			end
			if (Achat.find_by(produit_id: @id_produit[i]) != nil)
				@achat[k] = Achat.find_by(produit_id: @id_produit[i])
				k+=1
			end
		end	
		@region = Region.where(['place LIKE ?',"%#{params[:find]}%"])

		@region.each do |region|
			@id_region << region.id
			puts @id_region
		end
		j=0
		k=0
		for i in 0..@id_region.length-1 do
			if (Vente.find_by(region_id: @id_region[i])!=nil)
				@vente2[j] = Vente.find_by(region_id: @id_region[i])
				j+=1
			end
			if (Achat.find_by(region_id: @id_region[i]) != nil)
				@achat2[k] = Achat.find_by(region_id: @id_region[i])
				k+=1
			end
		end	
	end
end
