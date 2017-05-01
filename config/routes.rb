Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # get '/diets/core', to: 'diets#core'
  # get '/diets/moderation', to: 'diets#moderation'
  # get '/diets/options', to: 'diets#options'
  # get '/diets/cheat', to: 'diets#cheat'
  # get '/diets/plans', to: 'diets#plans'
  get '/diets/mobi_meals', to: 'diets#mobi_meals'
  get '/diets/edit', to: 'diets#edit'
  resources :diets
  resources :account_activations, only: [:edit]
  resources :programs
  resources :blogs
  get '/users_programs/:id/new', to: 'users_programs#new'
  post '/users_programs', to: 'users_programs#create'
end
