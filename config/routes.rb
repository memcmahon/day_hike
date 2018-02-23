Rails.application.routes.draw do
  resources :trips, only: [:index, :show]

  resources :trails, only: [:show]
end
