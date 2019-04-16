Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :expenses

  get 'dashboard' => 'dashboard#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  # for json api requests
  get 'api/:username' => 'users#expenses_json'
end
