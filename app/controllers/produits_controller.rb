class ProduitsController < ApplicationController

  def index
  	@produit = Produit.all
  end

end
