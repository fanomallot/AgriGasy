Rails.application.routes.draw do
  get 'bienvenues/index'
  get "/accueils",to: 'accueils#accueil'
  get "/admindashboard/authentification_vente", to: 'admindashboard#vente'
  get "/admindashboard/authentification_achat", to: 'admindashboard#achat'
  get "/admindashboard/liste_des_utilisateurs", to: 'admindashboard#utilisateur'
  get "/admindashboard/authentificate_vente/:id", to: 'admindashboard#updatevente'
  get "/admindashboard/authentificate_achat/:id", to: 'admindashboard#updateachat'
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
      resources :signalls
      resources :message_prives 
    end
    resources :achats do 
      resources :signal_achats
      resources :messagepriveachats 
    end
  end
  resources :regions
  resources :admins
  resources :recherches,only: [:index]
  resources :conditions, only: [:index]
  resources :bienvenues, only: [:index]
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end

