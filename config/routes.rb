Rails.application.routes.draw do
  resources :games, only: [:index, :show, :edit]

  root "games#index"

  mount ActionCable.server => "/cable"
end
