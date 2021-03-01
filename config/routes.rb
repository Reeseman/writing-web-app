Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root :to => 'application#index'

  get 'user_data', to: 'users#user_data'
end
