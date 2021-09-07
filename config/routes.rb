Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs
  resources :dishes
  resources :ingredients
  resources :dish_ingredients
  get '/chefs/:chef_id/ingredients', to: 'chefs#index'

end
