Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #dishes
  get '/dishes/:dish_id', to: 'dishes#show'
end
