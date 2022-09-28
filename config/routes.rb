Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: "pages#home"

  resources :products, shallow: true do
    resources :orders
  end
end
