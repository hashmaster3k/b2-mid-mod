Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index]
  resources :airlines, only: [:show]
  delete '/passengers/:id', to: 'passengers#destroy', as: 'remove_passenger_from_flight'
end
