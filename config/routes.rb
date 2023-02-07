Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/coffee_shops', to: 'coffee_shops#index'
  get '/coffee_shops/new', to: 'coffee_shops#new'
  post '/coffee_shops', to: 'coffee_shops#create'
  get '/coffee_shops/:id', to: 'coffee_shops#show'
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  
  get '/coffee_shops/:id/drinks', to: 'coffee_shop_drinks#index'
  post '/coffee_shops/:id/drinks', to: 'coffee_shop_drinks#create'
  get '/coffee_shops/:id/edit', to: 'coffee_shops#edit'
  #^takes me to the form
  patch '/coffee_shops/:id', to: 'coffee_shops#update'
  #^updates and back to former page


  get '/coffee_shops/:id/drinks/new', to: 'coffee_shop_drinks#new'

  get '/drinks/:id/edit', to: 'drinks#edit'
  patch '/drinks/:id', to: 'drinks#update'

  delete '/coffee_shops/:id', to: 'coffee_shops#destroy'
end
