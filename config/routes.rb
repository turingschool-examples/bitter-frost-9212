Rails.application.routes.draw do
  get 'ingredients/index'
  get 'ingredients/new'
  get 'ingredients/show'
  get 'ingredients/create'
  get 'dishes/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dishes/new', to: 'dishes#new'
  post '/dishes', to: 'dishes#create'
  get '/dishes/:id', to: 'dishes#show'

end
