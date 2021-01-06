Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root :to => 'home#index'
  resources :users
  get 'app', to: 'users#index'
  get 'api/v1/first_user_email', :to => 'users#first_user_email'
end
