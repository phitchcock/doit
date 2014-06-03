Rails.application.routes.draw do
  root "pages#index"

  devise_for :users
  resources :users, only: [:show]

  resources :lists do
    resources :tasks, only: [:create, :destroy]
  end

end
