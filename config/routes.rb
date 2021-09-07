Rails.application.routes.draw do
  resources :dishes, only: [:show, :new, :destroy]

  resources :chefs, only: [:show, :new, :destroy]
  get '/chefs/:id/ingredients', to: 'chef_ingredients#show', as: 'chef_ingredients'

  resources :ingredients, only: [:show, :new, :destroy]
end
