Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "completed_orders#index"
  resources :products
  resources :orders, only: [:new,:destroy]
  resources :order_items
  resources :completed_orders do
    member do
      get "redirect_to_google_map"
    end
  end
  resources :clients,only: [:index] do
    member do
      get "client_orders"
    end
  end
  resources :order_statuses,only: [:index,:new,:create,:edit,:update]
  resources :payment_methods,only: [:index,:new,:create,:edit,:update]
  resources :salinities,only: [:index,:new,:create,:edit,:update]
 
end
