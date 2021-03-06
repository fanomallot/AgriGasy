class VentesController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :is_admis_or_current_user?,only: [:edit,:destroy] 

  def index
    @vente = Vente.all
  end

  def show
    @vente = Vente.find(params[:id])
  end

  def new
    @vente = Vente.new
  end

  def create
    # ajout de tous ce qui sont obligatoire dans la table
    @vente = Vente.new(
      description: params[:description],
      quantite: params[:quantite],
      prix: params[:prix] + params[:unite],
      date: params[:date],
      lieu: params[:lieu],
      user: current_user, is_authenticate: false)
    # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == 0
      prodnew = Produit.create(name: params[:nom])
      @vente.produit = prodnew
    else
      check = 0
      @produit.each do |produit|
        if produit.name == params[:nom]
          check = 1
          break
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
    if @region.length == 0
      regionnew = Region.create(place: params[:place])
      @vente.region = regionnew
    else
      check = 0
      @region.each do |region|
        if region.place == params[:place]
          check = 1
          break
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
      flash[:success] = "La publication a été créée avec success, en attente d'authentification"
      redirect_to user_vente_path(current_user.id,@vente.id)
    else
      flash[:danger] = "Echec de la création"
      render "new"
    end
  end

  def edit
    @vente = Vente.find(params[:id])
  end

  def update
    @vente = Vente.find(params[:id])
     # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == 0
      prodnew = Produit.create(name: params[:nom])
      @vente_produit = prodnew
    else
      check = 0
      @produit.each do |produit|
        if produit.name == params[:nom]
          check = 1
          break
        else
          check = 0
        end
      end
      if check == 1 
        prodancien = Produit.find_by(name: params[:nom])
        @vente_produit = prodancien
      else
        prodnew = Produit.create(name: params[:nom])
        @vente_produit = prodnew
      end
    end
    # test si la region exist déjà dans la table region
    @region = Region.all 
    if @region.length == 0
      regionnew = Region.create(place: params[:place])
      @vente_region = regionnew
    else
      check = 0
      @region.each do |region|
        if region.place == params[:place]
          check = 1
          break
        else
          check = 0
        end
      end
      if check == 1 
        regionancien = Region.find_by(place: params[:place])
        @vente_region = regionancien
      else
        regionnew = Region.create(place: params[:place])
        @vente_region = regionnew
      end
    end
    # met à jour le vente avec ses parametres description, quatité, etc...
    if @vente.update(description: params[:description],
      quantite: params[:quantite], 
      prix: params[:prix],
       date: params[:date],
      lieu: params[:lieu], 
      produit: @vente_produit,
      region: @vente_region)
      flash[:success] = "La modification a été enregistré"
      redirect_to vente_path(@vente.id)
    else
      flash[:danger] = "Erreur"
      render "edit"
    end
  end

  def destroy

    # supprime la signal puis la vente
    @vente = Vente.find(params[:id])
    @signall = Signall.where(vente_id: @vente.id)
    @signall.destroy_all
    @vente.destroy
    redirect_to ventes_path
  end

  private
    def is_admis_or_current_user?
    @vente = Vente.find(params[:id])
    if current_user == @vente.user || current_user.is_admin
      return true
    else
      redirect_back fallback_location: '/' ,allow_other_host: false
    end

  end

end