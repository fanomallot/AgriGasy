class AccueilsController < ApplicationController

  def accueil
  	# recuperation des listes de vente et d'achat qui vont être affiché dans la page d'accueil 
  	@vente = Vente.all
  	@achat = Achat.all
  end

end
