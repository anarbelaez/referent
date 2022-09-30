Rails.application.routes.draw do
  devise_for :users

  # Pages
  root to: "pages#home", as: :home
  get "/search", to: "pages#search"

  # Users
  get "/referents", to: "users#index"
  resources :users, only: [:show] do
    # get "/products", to: "user#products"
    get :details
  end

  # Products
  resources :products, shallow: true do
    resources :orders
  end
end
