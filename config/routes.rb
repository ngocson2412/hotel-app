Rails.application.routes.draw do
  namespace :admins do
    get 'home/index'
    resources :admins, path: 'customers'
    patch '/customers/update_pwd/:id', to: 'admins#update_pwd', :as => 'customer_update_pwd'
    get 'customer/profile', to: 'profile#show', :as => 'customer_profile'
    get 'customer/profile/edit', to: 'profile#edit', :as => 'customer_profile_edit'
    patch 'customer/profile/update', to: 'profile#update', :as => 'customer_profile_update'
    patch 'customer/profile/update_pwd', to: 'profile#update_pwd', :as => 'customer_profile_pwd_update'
  end
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
