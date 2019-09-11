class AchatsController < ApplicationController

  def index
    @achat = Achat.all
  end

  def show
    @achat = Achat.find(params[:id])
  end

  def new
    @produit = Produit.new
    @region = Region.new
    @achat = Achat.new
  end

  def create
    @produit = Produit.create(name: params[:nom])
    # if Region.find_by(place: params[:place]) == nil
      @region = Region.create(place: params[:place])
    # else
    #   @region = Region.find_by(place: params[:place])
    # end
    @achat = achat.new(description: params[:description],
      quantite: params[:quantite], prix: params[:prix], date: params[:date],
      lieu: params[:lieu], user: current_user, region_id: @region.id, produit_id: @produit.id)
    if @achat.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @achat = Achat.find(params[:id])
  end

  def update
    @achat = Achat.find(params[:id])
    if @achat.update(nom: params[:nom], description: params[:description],
      quantite: params[:quantite], prix: params[:prix], date: params[:date],
      lieu: params[:lieu])
      redirect_to achat_path(@achat.id)
    else
      render "edit"
    end
  end

  def destroy
  end
  
end
