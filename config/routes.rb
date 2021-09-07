Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/dishes", to: "dishes#index"
  get "/dishes/:id", to: "dishes#show"

  get "/chefs", to: "chefs#index"
  get "/chefs/:chef_id", to: "chefs#show"
end
