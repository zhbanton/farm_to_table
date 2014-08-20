Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get 'farm/sign_up', to: 'registrations#new', user: { user_type: 'farm' }
    get 'organization/sign_up', to: 'registrations#new', user: { user_type: 'organization' }
  end

  root to: 'home#index'

end
