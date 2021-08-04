Rails.application.routes.draw do
  
  
  get 'line_items/create'
  get 'line_items/delete'
  
  root 'pages#home'
  devise_for :users

  post 'orders/create'
  
  get "/store", to: "items#index", as: :store
  get 'items/show/:id', to: 'items#show', as: :item
  
  get "add_item", to: "items#new"
  post "add_item", to: "items#create"

  post "add_to_cart", to: "line_items#create", as: :add_to_cart
  get 'my_cart', to: "line_items#index", as: :my_cart

  get '/order_confirmation', to: 'pages#order_confirmation', as: :order_confirmation

end 
