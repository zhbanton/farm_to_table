Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  devise_scope :user do
    get 'farm/sign_up', to: 'registrations#new', user: { user_type: 'farm' }
    get 'organization/sign_up', to: 'registrations#new', user: { user_type: 'organization' }
  end

  resources :farms, only: [] do
    resources :products
    resources :postings, only: [:index]
  end

  resources :products, only: [] do
    resources :postings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :postings, only: [:show]

  resources :organizations, only: [] do
    resources :orders, only: [:index, :show, :new, :update]
  end

  resources :order_items, only: [:index, :create, :update, :destroy]

  root to: 'home#index'

end
