Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/dishes", to: "dishes#index"
  get "/dishes/new", to: "dishes#new"
  post "/dishes", to: "dishes#create"
  get "/dishes/:id", to: "dishes#show"

  get "/chefs", to: "chefs#index"
  get "/chefs/new", to: "chefs#new"
  post "/chefs", to: "chefs#create"
  get "/chefs/:id", to: "chefs#show"

  get "/chefs/:id/ingredients", to: "chef_ingredients#index"
  get "/chefs/:id/ingredients/new", to: "chef_ingredients#new"
  post "/chefs/:id/ingredients", to: "chef_ingredients#create"
  # get "/chefs/:id/ingredient/:dish_id", to: "chef_dishes#show"

  get "/chefs/:id/dishes", to: "chef_dishes#index"
  get "/chefs/:id/dishes/new", to: "chef_dishes#new"
  post "/chefs/:id/dishes", to: "chef_dishes#create"
  get "/chefs/:id/dishes/:dish_id", to: "chef_dishes#show"

end
