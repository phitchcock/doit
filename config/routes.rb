Rails.application.routes.draw do
  root "lists#index"

  devise_for :users

  resources :lists do
    resources :tasks, only: [:create]
  end

end
