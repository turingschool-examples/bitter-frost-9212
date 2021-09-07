Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes
  resources :ingredients
  resources :chefs

  get '/chefs/:id/ingredients', to: 'chef_ingredients#index'
end
