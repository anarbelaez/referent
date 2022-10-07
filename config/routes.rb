Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users

  # Pages
  root to: "pages#home", as: :home
  get "/search", to: "pages#search"

  # Referents
  get "/referents", to: "users#index"
  get "/referents/new", to: "users#new_referent", as: :new_referent
  patch "/referents/:id", to: "users#create_referent", as: :create_referent

  resources :users, only: [:show] do
    # get "/products", to: "user#products"
    resources :reviews, only: %i[new create edit update]
    get :details
  end

  # Products
  resources :products, shallow: true do
    resources :orders, except: [:index]
  end

  resources :reviews, only: [:destroy]

  # Orders
  patch "orders/:order_id/mark", to: "orders#close_order"
end
