Rails.application.routes.draw do
  root "pages#index"

  devise_for :users
  resources :users

  resources :lists do
    resources :tasks, only: [:create, :destroy]
  end

  namespace :api, defaults: {format: :json} do 
   namespace :v1 do
    resources :users
    resources :lists do
      resources :tasks
    end
   end
  end

  namespace :apitest, path: '/', constraints: {subdomain: 'apitest'} do
    namespace :v1 do
      resources :lists, defaults: {format: :json}
    end
  end

end
