Rails.application.routes.draw do
  get "/accueils",to: 'accueils#accueil'
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
    resources :message_prives
  end
  resources :regions
  resources :recherches,only: [:index]
end

