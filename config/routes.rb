Rails.application.routes.draw do
  devise_for :users

  # Pages
  root to: "pages#home", as: :home

  # Referents
  get "/referents", to: "users#index"
  get "/referents/new", to: "users#new_referent", as: :new_referent
  patch "/referents", to: "users#create_referent"

  resources :users, only: [:show] do
    # get "/products", to: "user#products"
    get :details
  end

  # Products
  resources :products, shallow: true do
    resources :orders, except: [:index]
  end

 # Orders
  patch "orders/:order_id/mark", to: "orders#close_order"
  end
