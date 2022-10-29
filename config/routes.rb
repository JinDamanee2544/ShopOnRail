Rails.application.routes.draw do
  get 'shop/:id', to: 'shop#index', as: 'shop_index'
  post 'shop/:id', to: 'shop#buy', as: 'shop_buy'
  get 'main/inventory' => 'main#inventory' , as: 'main_inventory'

  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_item' , as: 'main_user_item'
  
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
