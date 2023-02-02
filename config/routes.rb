Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/coffee_shops', to: 'coffee_shops#index'
  get '/coffee_shops/:id', to: 'coffee_shops#show'
  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
end
