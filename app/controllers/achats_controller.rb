class AchatsController < ApplicationController

  def index
    @achat = Achat.all
  end

  def show
    @achat = Achat.find(params[:id])
  end

  def new
    
  end

  def create
  # ajout de tous ce qui sont obligatoire dans la table
    @achat = Achat.new(description: params[:description],
      quantite: params[:quantite], user: current_user)
  # test des autre sans validation dans le cas ou ils existent
    if params[:prix] != nil
      @achat.prix = params[:prix]
    end
    if params[:date] != nil
      @achat.date = params[:date]
    end
    if params[:lieu]
      @achat.lieu = params[:lieu]
    end
  # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == nil
      prodnew = Produit.create(name: params[:nom])
      @achat.produit = prodnew
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
        @achat.produit = prodancien
      else
        prodnew = Produit.create(name: params[:nom])
        @achat.produit = prodnew
      end
    end
  # test si la region exist déjà dans la table region
    @region = Region.all 
    if @region.length == nil
      regionnew = Region.create(place: params[:place])
      @achat.region = regionnew
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
        @achat.region = regionancien
      else
        regionnew = Region.create(place: params[:place])
        @achat.region = regionnew
      end
    end
  # test de sauvegarde des donnés
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
