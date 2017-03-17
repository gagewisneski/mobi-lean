Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'users#index'
  resources :users

  get '/diets/core', to: 'diets#core'
  get '/diets/moderation', to: 'diets#moderation'
  get '/diets/options', to: 'diets#options'
  get '/diets/cheat', to: 'diets#cheat'
  get '/diets/plans', to: 'diets#plans'
  resources :diets
end
