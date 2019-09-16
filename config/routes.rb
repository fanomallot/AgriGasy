Rails.application.routes.draw do
  get "/accueils",to: 'accueils#accueil'
  get "/authentification_vente", to: 'admindasboard#vente'
  get "/authentification_achat", to: 'admindasboard#achat'
  get "/liste_des_utilisateurs", to: 'admindasboard#utilisateur'
  get "/authentificate_vente", to: 'admindasboard#updatevente'
  devise_for :users
  root to: 'accueils#accueil'
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

