Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chefs
  resources :dishes
  resources :ingredients
  resources :dish_ingredients
  get '/chefs/:chef_id/ingredients', to: 'chefs#index'

end
                #     chefs GET    /chefs(.:format)                       chefs#index
                #           POST   /chefs(.:format)                       chefs#create
                #  new_chef GET    /chefs/new(.:format)                   chefs#new
                # edit_chef GET    /chefs/:id/edit(.:format)              chefs#edit
                #      chef GET    /chefs/:id(.:format)                   chefs#show
                #           PATCH  /chefs/:id(.:format)                   chefs#update
                #           PUT    /chefs/:id(.:format)                   chefs#update
                #           DELETE /chefs/:id(.:format)                   chefs#destroy
    #               dishes GET    /dishes(.:format)                       dishes#index
    #                      POST   /dishes(.:format)                       dishes#create
    #             new_dish GET    /dishes/new(.:format)                   dishes#new
    #            edit_dish GET    /dishes/:id/edit(.:format)              dishes#edit
    #                 dish GET    /dishes/:id(.:format)                   dishes#show
    #                      PATCH  /dishes/:id(.:format)                   dishes#update
    #                      PUT    /dishes/:id(.:format)                   dishes#update
    #                      DELETE /dishes/:id(.:format)                   dishes#destroy
    #          ingredients GET    /ingredients(.:format)                  ingredients#index
    #                      POST   /ingredients(.:format)                  ingredients#create
    #       new_ingredient GET    /ingredients/new(.:format)              ingredients#new
    #      edit_ingredient GET    /ingredients/:id/edit(.:format)         ingredients#edit
    #           ingredient GET    /ingredients/:id(.:format)              ingredients#show
    #                      PATCH  /ingredients/:id(.:format)              ingredients#update
    #                      PUT    /ingredients/:id(.:format)              ingredients#update
    #                      DELETE /ingredients/:id(.:format)              ingredients#destroy
    #     dish_ingredients GET    /dish_ingredients(.:format)             dish_ingredients#index
    #                      POST   /dish_ingredients(.:format)             dish_ingredients#create
    #  new_dish_ingredient GET    /dish_ingredients/new(.:format)         dish_ingredients#new
    # edit_dish_ingredient GET    /dish_ingredients/:id/edit(.:format)    dish_ingredients#edit
    #      dish_ingredient GET    /dish_ingredients/:id(.:format)         dish_ingredients#show
    #                      PATCH  /dish_ingredients/:id(.:format)         dish_ingredients#update
    #                      PUT    /dish_ingredients/:id(.:format)         dish_ingredients#update
    #                      DELETE /dish_ingredients/:id(.:format)         dish_ingredients#destroy
