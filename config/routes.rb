Rails.application.routes.draw do

  get 'category/index'

  get 'sessions/new'
  get '/logout', to: 'static_pages#home'

  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :expenses


  get 'dashboard' => 'dashboard#index'
  get 'category' => 'category#index'

  # for json api requests
  get '/:email' => 'users#get_json_expenses'
  post '/api' => 'expenses#post_json_expense'
end
