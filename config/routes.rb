Rails.application.routes.draw do
# Root
  root 'store#index'

# Store
  # get 'store/index'
  get 'store/product/:id', to: 'store#product', as: 'store_product'
  # get 'store/computers'
  # get 'store/deodorants'
  get 'store/products'

# Login
  get 'login', to: "login#ask"
  post 'login/validate'
  delete 'login/logout'

# Profile routes
  get 'profile', to: "profile#show"
  get 'profile/edit_password', to: "profile#edit_password"
  get 'profile/edit', to: "profile#edit"
  resources :profile, only: [:update]

# Admin routes
  get 'admin', to: 'admin#index'
  namespace :admin do
    # User management
    patch 'active_toggle', to: 'users#active_toggle'
    get 'users/:id/edit_password', to: 'users#edit_password', as: 'edit_user_password'
    resources :users

    # Product management
    resources :products
  end

end
