Rails.application.routes.draw do
  root 'pages#home'

  get "/store", to: "items#index", as: :store
  get 'items/show/:id', to: 'items#show', as: :item

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
