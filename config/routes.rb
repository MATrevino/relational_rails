Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/coffee_shops', to: 'coffee_shops#index'
  get '/coffee_shops/id', to: 'coffee_shops#show'
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/coffee_shops/:coffee_shop_id/drinks', to: 'coffee_shop_drinks#index'
  get '/coffee_shops/new', to: 'coffee_shops#new'
  post '/coffee_shops', to: 'coffee_shops#create'
  get '/coffee_shops/:id/edit', to: 'coffee_shops#edit'
  patch '/coffee_shops/:id', to: 'coffee_shops#update'
end
