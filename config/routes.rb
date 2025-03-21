Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  resources :books do
    resources :feedbacks
  end
  resources :book_sellers
  resources :addresses
  get "cart", to: "carts#show"
  post "cart_item/add/:book_id", to: "cart_items#create", as: "cart_item_add"
  delete "clear_cart/:secret_id", to: "carts#destroy", as: "clear_cart"
  delete "cart_item/:id", to: "cart_items#destroy", as: "cart_item_delete"
  patch "cart_item/:id", to: "cart_items#update", as: "cart_item"
  resources :orders
end
