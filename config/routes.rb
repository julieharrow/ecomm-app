Rails.application.routes.draw do

  # get 'carts/:id' => 'carts#show', as: :cart  #not necessary with resources

  root 'homes#index'

  devise_for :users
  resources :products
  resources :carts

  post 'line_items' => "products#line_item_create"

  post "order_complete" => "carts#order_complete"

end
