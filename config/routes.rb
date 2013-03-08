Store::Application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :publishers
  resources :categories
end
