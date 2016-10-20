Rails.application.routes.draw do
  resources :participants
  resources :seasons, only: [:index, :show, :create]
end
