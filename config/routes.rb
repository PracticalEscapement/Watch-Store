Rails.application.routes.draw do
  root 'pages#home'

  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
