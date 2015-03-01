Rails.application.routes.draw do
  resources :companies

  resources :emails, except: [:index, :show]

  resources :phone_numbers, except: [:index, :show]

  resources :people
end
