class VentesController < ApplicationController

  def index
    @vente = Vente.all
  end

  def show
    @vente = Vente.find(params[:id])
  end

  def new
    @produit = Produit.new
    @region = Region.new
    @vente = Vente.new
  end

  def create
    @produit = Produit.create(name: params[:nom])
    # if Region.find_by(place: params[:place]) == nil
      @region = Region.create(place: params[:place])
    # else
    #   @region = Region.find_by(place: params[:place])
    # end
    @vente = Vente.new(description: params[:description],
      quantite: params[:quantite], prix: params[:prix], date: params[:date],
      lieu: params[:lieu], user: current_user, region_id: @region.id, produit_id: @produit.id)
    if @vente.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @vente = Vente.find(params[:id])
  end

  def update
    @vente = Vente.find(params[:id])
    if @vente.update(nom: params[:nom], description: params[:description],
      quantite: params[:quantite], prix: params[:prix], date: params[:date],
      lieu: params[:lieu])
      redirect_to vente_path(@vente.id)
    else
      render "edit"
    end
  end

  def destroy
  end
  
end
