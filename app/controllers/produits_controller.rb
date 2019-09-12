class ProduitsController < ApplicationController
  def index
  	@produit = Produit.all
  end
  def show
  	@produit = Produit.find(params[:id])
  end
end
