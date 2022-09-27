Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :products, shallow: true do
    resources :orders
  end
end
