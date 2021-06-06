Rails.application.routes.draw do
  
  root 'pages#home'
  devise_for :users

  post 'orders/create'
  
  get "/store", to: "items#index", as: :store
  get 'items/show/:id', to: 'items#show', as: :item
  
  get "add_item", to: "items#new"
  post "add_item", to: "items#create"

end 
