Rails.application.routes.draw do
  devise_for :farms, class_name: 'User'
  devise_for :organizations, class_name: 'User'
end
