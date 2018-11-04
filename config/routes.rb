Rails.application.routes.draw do


  get 'sessions/new'

  root 'page#index'

  resources 'users'

  resources 'carts'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  resources 'carts' do
    resources 'products'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
