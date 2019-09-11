class VentesController < ApplicationController

  def index
    @vente = Vente.all
  end

  def show
    @vente = Vente.find(params[:id])
  end

  def new
  end

  def create
    # ajout de tous ce qui sont obligatoire dans la table
    @vente = Vente.new(
      description: params[:description],
      quantite: params[:quantite],
      prix: params[:prix],
      date: params[:date],
      lieu: params[:lieu],
      user: current_user)
    # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == nil
      prodnew = Produit.create(name: params[:nom])
      @vente.produit = prodnew
    else
      check = 0
      @produit.each do |produit|
        if produit == params[:nom]
          check = 1
          break
        else
          check = 0
        end
      end
      if check == 1 
        prodancien = Produit.find_by(name: params[:nom])
        @vente.produit = prodancien
      else
        prodnew = Produit.create(name: params[:nom])
        @vente.produit = prodnew
      end
    end
    # test si la region exist déjà dans la table region
    @region = Region.all 
    if @region.length == nil
      regionnew = Region.create(place: params[:place])
      @vente.region = regionnew
    else
      check = 0
      @region.each do |region|
        if region == params[:place]
          check = 1
          break
        else
          check = 0
        end
      end
      if check == 1 
        regionancien = Region.find_by(place: params[:place])
        @vente.region = regionancien
      else
        regionnew = Region.create(place: params[:place])
        @vente.region = regionnew
      end
    end
    # test de sauvegarde des donnés
    if @vente.save
      flash[:success] = 'Publication de vente bien créé'
      redirect_to root_path
    else
      flash[:danger] = 'Echec de publication de vente'
      render "new"
    end
  end

  def edit
    @vente = Vente.find(params[:id])
  end

  def update
    @vente = Vente.find(params[:id])
    @produit = Produit.find(params[:id])
    @produit.save(name: params[:nom])
    if @vente.update(description: params[:description],
      quantite: params[:quantite], prix: params[:prix], date: params[:date],
      lieu: params[:lieu], produit_id: @produit.id)
      redirect_to vente_path(@vente.id)
    else
      render "edit"
    end
  end

  def destroy
    @vente = Vente.find(params[:id])
    @signall = Signall.where(vente_id: @vente.id)
    @signall.destroy_all
    @vente.destroy
    redirect_to root_path
  end
  
end
