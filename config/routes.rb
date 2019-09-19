Rails.application.routes.draw do
  get 'bienvenues/index'
  get "/accueils",to: 'accueils#accueil'
  get "/user/:id/mes_ventes",to: 'users#uservente',as: 'mes_ventes'
  get "/user/:id/mes_achats",to: 'users#userachat',as: 'mes_achats'
  get "/admindashboard/authentification_vente", to: 'admindashboard#vente',as:'admincheckvente'
  get "/admindashboard/authentification_achat", to: 'admindashboard#achat',as:'admincheckachat'
  get "/admindashboard/liste_des_utilisateurs", to: 'admindashboard#utilisateur',as:'admincheckuser'
  get "/admindashboard/authentificate_vente/:id", to: 'admindashboard#updatevente',as:'authentificate_vente'
  get "/admindashboard/authentificate_achat/:id", to: 'admindashboard#updateachat',as:'authentificate_achat'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'admins#index'
  resources :ventes do
    resources :avatarventes
  end
  resources :achats do
    resources :avatarachats
  end
  resources :produits
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :profils, only: [:create]
    resources :ventes do 
      resources :signalls,only:[:index,:create]
      resources :message_prives 
    end
    resources :achats do 
      resources :signal_achats,only:[:index,:create]
      resources :messagepriveachats 
    end
  end
  resources :regions
  resources :admins
  resources :recherches,only: [:index]
  resources :conditions, only: [:index]
  resources :bienvenues, only: [:index]

end

