Rails.application.routes.draw do
  resources :dishes, only: :show

  resources :chefs, only: :show do
    resources :ingredients, only: :index
  end

  # I used nested routes here for practice as we never interact
  # with ingredients outside of the context of a specific chef.
  # Should we want to expand the application outside of the requirments
  # for the IC, I would go with:
  # get '/chefs/:chef_id/ingredients' to: 'chef_ingredients#index'
  # or create an un-nested ingredients resource, depending on the situation.
end
