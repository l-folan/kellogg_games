Rails.application.routes.draw do
  resources :game_categories
  resources :attendees
  resources :messages
  resources :games
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
