Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  resources :products do
    resources :comments
  end

  get 'users/redis'

  resources :users

  post 'payments/create'

  get 'simple_pages/products'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  root 'simple_pages#landing_page'
  get 'products/index'
  post 'simple_pages/thank_you'
  

  mount ActionCable.server => '/cable'

  resources :orders, only: [:index, :show, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
