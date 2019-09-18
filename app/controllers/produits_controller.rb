class ProduitsController < ApplicationController
before_action :is_admins,only: [:destroy]
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
    flash[:success] = "Produit éffacé avec succés"
  	redirect_to produits_path
  end
  private
  def is_admins
    if current_user.is_admin
      return true
    else 
      redirect_back fallback_location: '/' ,allow_other_host: false
    end
  end
end