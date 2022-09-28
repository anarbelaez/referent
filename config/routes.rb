Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/referents", to: "users#index"
  resources :users, only: [:show]

  resources :products, shallow: true do
    resources :orders
  end
end
