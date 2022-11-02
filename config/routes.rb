Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: %i[create index]
  end
  resources :users, only: [:show]
end
