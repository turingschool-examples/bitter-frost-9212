Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  # get '/', to: 'index#welcome'

  get '/dishes', to: 'dishes#index'
  # get '/dishes/new', to: 'dishes#new'
  get '/dishes/:id', to: 'dishes#show'
  # post '/dishes', to: 'dishes#create'
  # get '/dishes/:id/edit', to: 'dishes#edit'
  # patch '/dishes/:id', to: 'dishes#update'
  # delete '/dishes/:id', to: 'dishes#destroy'
end
