class AccueilsController < ApplicationController

  def accueil
  	@vente = Vente.where(is_authenticate: true)
  	@achat = Achat.where(is_authenticate: true)
  	@achatnew = []
  	if @achat.length < 6
  		  @achatnew = @achat 
  	else
  		for i in @achat.length-6...@achat.length do
        if @achat[i].is_authenticate
    			@achatnew << @achat[i]
        end
  		end
  	end 
  	  @ventenew = []
  	if @vente.length < 6
  		@ventenew = @vente
  	else
  		for i in @vente.length-6..@vente.length-1 do
	  			@ventenew << @vente[i]
  		end
  	end
  end

end
