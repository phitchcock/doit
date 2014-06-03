Rails.application.routes.draw do
  root "pages#index"

  devise_for :users

  resources :lists do
    resources :tasks, only: [:create]
  end

end
