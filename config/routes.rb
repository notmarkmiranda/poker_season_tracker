Rails.application.routes.draw do
  resources :participants
  resources :games
  resources :seasons, only: [:index, :show, :create]

  get '/error/404', to: "errors#show", as: "error_404"
end
