Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "rooms#index"

  resources :rooms, only: [:new, :create, :destroy] do
    member do
      patch 'habit_change'
      post 'habit_add'
    end
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:index]
  resources :habits, only: [:new, :create, :destroy]
end
