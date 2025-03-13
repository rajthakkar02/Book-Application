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
end
