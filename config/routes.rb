Rails.application.routes.draw do
  resources :games
  resources :players, only: [:index, :show, :new, :create, :update]
  resources :participants
  resources :seasons, only: [:index, :show, :create]

  get '/error/404', to: "errors#show", as: "error_404"
end
