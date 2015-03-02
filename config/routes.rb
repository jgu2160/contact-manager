Rails.application.routes.draw do
  resources :companies
  resources :emails, except: [:index, :show]
  resources :phone_numbers, except: [:index, :show]
  resources :people
  resource :sessions, :only => [:create, :destroy]
  root to: 'site#index'
  match "/login" => redirect("/auth/twitter"), as: :login, via: [:get, :post]
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
end
