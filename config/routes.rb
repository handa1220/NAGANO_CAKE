Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :homes, only: [:top, :about]
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :update, :destroy, :create]
  resources :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  get "customers/my_page" => "customers#show", as: "my_page_customers"
  get "customers/information/edit" => "customers#edit", as: "edit_information_customers"
  patch "customers/information" => "customers#update", as: "information_customers"
  get "customers/unsubscribe", as: "unsubscribe_customers"
  patch "customers/withdraw", as: "withdraw_customers"
  post "orders/confirm", as: "confirm_orders"
  get "orders/thanks", as: "thanks_orders"
  delete "cart_items/destroy_all", as: "destroy_all"
  
  namespace :admin do
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  
  
end
