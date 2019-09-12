Rails.application.routes.draw do
  get 'produits/index'
  devise_for :users
  root to: 'accueils#accueil'
  resources :ventes
  resources :achats
  resources :produits
  resources :message_prives
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :profils, only: [:create]
  end
  resources :regions
end

