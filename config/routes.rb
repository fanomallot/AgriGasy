Rails.application.routes.draw do
  get 'accueils/accueil'
  get 'achats/index'
  get 'achats/show'
  get 'achats/new'
  get 'achats/create'
  get 'achats/edit'
  get 'achats/update'
  get 'achats/destroy'
  get 'ventes/index'
  get 'ventes/show'
  get 'ventes/new'
  get 'ventes/create'
  get 'ventes/edit'
  get 'ventes/update'
  get 'ventes/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
