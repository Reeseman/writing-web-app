Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'home/index'
  root :to => 'home#index'
  resources :users
  get 'app', to: 'users#index'
  get 'api/v1/first_user_email', :to => 'users#first_user_email'
end
