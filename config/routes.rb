Rails.application.routes.draw do
  devise_for :users
  root to: 'accueils#accueil'
  resources :ventes
  resources :achats
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end

