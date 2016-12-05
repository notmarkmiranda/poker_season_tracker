Rails.application.routes.draw do

  root "pages#index"

  resources :games
  resources :players, only: [:index, :show, :new, :create, :update]
  resources :participants
  resources :seasons, only: [:index, :show, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :participants, only: [:index, :show]
      resources :ordered_games, only: [:index]
      resources :players, only: [:index, :show]
      resources :games, only: [:index, :update]
      resources :seasons, only: [:index]
    end
  end

  get  '/login',  to: 'sessions#new', as: 'login'
  post '/login',  to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy', as: 'logout'

  get '/error/404', to: "errors#show", as: "error_404"
end
