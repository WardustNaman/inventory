Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  post 'products/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'products#index'
  resources :products
  resources :transactions
end
