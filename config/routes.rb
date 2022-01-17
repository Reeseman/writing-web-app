Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'application#index'

  get 'user_data', to: 'users#user_data'

  get '/connections', to: 'connections#show'
  get '/make_connection', to: 'connections#make_connection'
  get '/delete_connection', to: 'connections#delete_connection'
end
