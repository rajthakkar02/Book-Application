Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  resources :books, except: %i[index] do
    resources :feedbacks, except: %i[index new show]
  end
  resources :book_sellers
  resources :addresses, except: %i[show]
  get "cart", to: "carts#show"
  delete "clear_cart/:secret_id", to: "carts#destroy", as: "clear_cart"
  post "cart_item/add/:book_id", to: "cart_items#create", as: "cart_item_add"
  delete "cart_item/:id", to: "cart_items#destroy", as: "cart_item_delete"
  patch "cart_item/:id", to: "cart_items#update", as: "cart_item"
  resources :orders, except: %i[edit new]
end
