Rails.application.routes.draw do
  get "/accueils",to: 'accueils#accueil'
  get "/admindashboard/authentification_vente", to: 'admindashboard#vente'
  get "/admindashboard/authentification_achat", to: 'admindashboard#achat'
  get "/admindashboard/liste_des_utilisateurs", to: 'admindashboard#utilisateur'
  get "/admindashboard/authentificate_vente", to: 'admindashboard#updatevente'
  devise_for :users
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
      resources :message_prives 
    end
    resources :achats do 
      resources :messagepriveachats 
    end
  end
  resources :regions
  resources :admins
  resources :recherches,only: [:index]

end

