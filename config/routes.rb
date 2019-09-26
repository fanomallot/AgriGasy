Rails.application.routes.draw do
  get "/accueils",to: 'accueils#accueil'
  get "/user/:id/mes_ventes",to: 'users#uservente', as: 'mes_ventes'
  get "/user/:id/mes_achats",to: 'users#userachat', as: 'mes_achats'
  get "/admindashboard/authentification_vente", to: 'admindashboard#vente', as:'admincheckvente'
  get "/admindashboard/authentification_achat", to: 'admindashboard#achat', as:'admincheckachat'
  get "/admindashboard/liste_des_utilisateurs", to: 'admindashboard#utilisateur', as:'admincheckuser'
  get "/admindashboard/authentificate_vente/:id", to: 'admindashboard#updatevente', as:'authentificate_vente'
  get "/admindashboard/authentificate_achat/:id", to: 'admindashboard#updateachat', as:'authentificate_achat'
  get "/recherche", to: 'message_prives#search_user', as: 'find_user'
  delete "/suppression_des_messages/:id ",to: 'message_prives#destroy_all',as:'supprimer_discu'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'admins#index'
  resources :ventes, path: '/ventes' do
    resources :avatarventes
  end
  resources :achats, path: '/achats' do
    resources :avatarachats
  end
  resources :produits, path: '/produits'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, path: '/mon_profil' do
    resources :profils, only: [:create]
    resources :message_prives, path: '/Messages' 
    resources :ventes, path: '/mes_ventes' do 
      resources :signalls,only:[:index,:create]
      
    end
    resources :achats, path: '/mes_besoins' do 
      resources :signal_achats, only:[:index,:create]
    end
  end
  resources :regions, path: '/regions'
  resources :admins, path: '/admindashboard'
  resources :recherches,only: [:index], path: '/recherche'
  resources :conditions, only: [:index], path: '/a_savoir'
  resources :bienvenues, only: [:index], path: '/bienvenue'

end

