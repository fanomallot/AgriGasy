class AccueilsController < ApplicationController

  def accueil
  	@vente = Vente.all
  	@achat = Achat.all
  end

end
