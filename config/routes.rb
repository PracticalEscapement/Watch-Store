Rails.application.routes.draw do
  
  root 'pages#home'
  devise_for :users
  
  get '/store', to: 'items#index', as: :store
  get 'items/show/:id', to: 'items#show', as: :item
  
  get 'add_item', to: 'items#new'
  post 'add_item', to: 'items#create'

  post 'add_to_cart', to: 'line_items#create', as: :add_to_cart
  get 'my_cart', to: 'line_items#index', as: :my_cart
  post 'clear_cart', to: 'line_items#destroy', as: :clear_cart
  put 'update_line_item_quantity', to:  'line_items#update', as: :update_line_item_quantity
  

  get '/shipping_info', to: 'orders#shipping_info', as: :shipping_info
  post '/add_shipping_info', to: 'orders#add_shipping_info', as: :add_shipping_info
  get '/order_summary', to: 'orders#order_summary', as: :order_summary
  get '/order_confirmation', to: 'orders#order_confirmation', as: :order_confirmation
  resources :orders, only: [:create]
  
end 
