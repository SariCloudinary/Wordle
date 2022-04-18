Rails.application.routes.draw do
  resources :guesses
  resources :game_sessions
  resources :games
  root "home#index"

  resources :user_words, :words, :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post 'home/new_game', to: 'home#new_game'

end
