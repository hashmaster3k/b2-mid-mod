Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index]
  scope :flights do
    delete '/passengers/:id', to: 'passenger_flights#destroy', as: 'remove_passenger_from_flight'
  end

  resources :airlines, only: [:show]
  get '/passengers', to: 'passengers#index'
end
