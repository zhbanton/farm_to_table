Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  devise_scope :user do
    get 'farm/sign_up', to: 'registrations#new', user: { user_type: 'farm' }
    get 'organization/sign_up', to: 'registrations#new', user: { user_type: 'organization' }
  end

  resources :farms, only: :show do
    resources :products
    resources :postings, only: [:index]
    resources :farm_pickup_days, only: [:index]
  end

  resources :products, only: [] do
    resources :postings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :postings, only: [:show]

  resources :organizations, only: [] do
    resources :orders, only: [:index, :show, :new, :update]
    resources :organization_pickup_days, only: [:index]
    resources :order_history, only: [:index]
  end

  resources :order_items, only: [:index, :show, :create, :update, :destroy]

  root to: 'home#index'

end
