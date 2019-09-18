class AchatsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  before_action :is_admis_or_current_user?,only: [:edit,:destroy] 
  def index
    @achat = Achat.all
  end

  def show
    @achat = Achat.find(params[:id])
  end

  def new
    @achat = Achat.new
  end

  def create
  # ajout de tous ce qui sont obligatoire dans la table
    @achat = Achat.new(description: params[:description],
      prix: params[:prix] + params[:unite] ,
      date: params[:date],
      lieu: params[:lieu],
      quantite: params[:quantite], 
      user: current_user, is_authenticate: false)
  # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == 0
      prodnew = Produit.create(name: params[:nom])
      @achat.produit = prodnew
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
        @achat.produit = prodancien
      else
        prodnew = Produit.create(name: params[:nom])
        @achat.produit = prodnew
      end
    end
  # test si la region exist déjà dans la table region
    @region = Region.all 
    if @region.length == 0
      regionnew = Region.create(place: params[:place])
      @achat.region = regionnew
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
        @achat.region = regionancien
      else
        regionnew = Region.create(place: params[:place])
        @achat.region = regionnew
      end
    end
  # test de sauvegarde des donnés
    if @achat.save
      flash[:success] = "La publication a été créée avec success,attent d'authentification"
      redirect_to achat_path(@achat.id)
    else
      flash[:danger] = "erreur de création"
      render "new"
    end
  end

  def edit
    @achat = Achat.find(params[:id])
  end

  def update
    @achat = Achat.find(params[:id])
  # test si le produit exist déjà dans la table produit
    @produit = Produit.all 
    if @produit.length == 0
      prodnew = Produit.create(name: params[:nom])
      @achat_produit = prodnew
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
        @achat_produit = prodancien
      else
        prodnew = Produit.create(name: params[:nom])
        @achat_produit = prodnew
      end
    end
    # test si la region exist déjà dans la table region
    @region = Region.all 
    if @region.length == 0
      regionnew = Region.create(place: params[:place])
      @achat_region = regionnew
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
        @achat_region = regionancien
      else
        regionnew = Region.create(place: params[:place])
        @achat_region = regionnew
      end
    end



    if @achat.update(description: params[:description],
      quantite: params[:quantite],
      prix: params[:prix],
      date: params[:date],
      lieu: params[:lieu], 
      produit: @achat_produit,
      region: @achat_region)
      flash[:success] = "La publication a été créée avec success,attent d'authentification"
      redirect_to achat_path(@achat.id)
    else
      flash[:danger] = "erreur de création"
      render "edit"
    end
  end

  def destroy
    @achat = Achat.find(params[:id])
    @signall = Signall.where(achat_id: @achat.id)
    @signall.destroy_all
    @achat.destroy
    redirect_to root_path
  end
  private
    def is_admis_or_current_user?
    @achat = Achat.find(params[:id])
    if current_user == @achat.user || current_user.is_admin
      return true
    else
      redirect_back fallback_location: '/' ,allow_other_host: false
    end
  end
end