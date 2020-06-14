Rails.application.routes.draw do
  resource :users, only: [:create, :update, :destroy, :update]
  resource :events, only: [:create, :show, :destroy]
  post '/login', to: 'users#login'
  get '/users', to: 'users#show'
end
