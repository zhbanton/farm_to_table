Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
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

  root to: 'home#index'

end
