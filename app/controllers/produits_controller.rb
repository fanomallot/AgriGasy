class ProduitsController < ApplicationController

  def index
  	@produit = Produit.all
  end

  def show
  	@produit = Produit.find(params[:id])
  end

  def destroy
  	@produit = Produit.find(params[:id])
  	@vente = Vente.where(produit_id: @produit)
  	@vente.destroy_all
  	@achat = Achat.where(produit_id: @produit)
  	@achat.destroy_all
  	@produit.destroy
  	redirect_to produits_path
  end
end
