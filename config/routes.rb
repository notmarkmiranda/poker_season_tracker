Rails.application.routes.draw do

  root "pages#index"

  resources :games
  resources :players, only: [:index, :show, :new, :create, :update]
  resources :participants
  resources :seasons, only: [:index, :show, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :participants, only: [:index, :show]
    end
  end

  get '/error/404', to: "errors#show", as: "error_404"
end
