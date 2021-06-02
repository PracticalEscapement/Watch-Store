Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get "/store", to: "items#index", as: :store
  get 'items/show/:id', to: 'items#show', as: :item
  
  get "add_item", to: "items#new"
  post "add_item", to: "items#create"

end 
