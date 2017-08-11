Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :create]
  match 'games/end', to: 'games#destroy', as: 'end_game', via: [:get, :delete]
  patch 'grids/:row/:column', to: 'grids#update', as: 'grids'
  root 'home#index'
end
