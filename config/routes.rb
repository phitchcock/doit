Rails.application.routes.draw do
  root "pages#index"

  devise_for :users
  resources :users, only: [:show]

  resources :lists do
    resources :tasks, only: [:create, :destroy]
  end

  namespace :api, defaults: {format: :json} do 
   namespace :v1 do
    resources :lists, only: [:index]
    resources :tasks, only: [:index]
    resources :users, only: [:index]
   end
 end

end
