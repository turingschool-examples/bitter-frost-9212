# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dishes/:id', to: 'dish#show'

  get '/chefs/:id', to: 'chef#show'

  get 'chefs/:chef_id/ingredients', to: 'chef#index'
end
