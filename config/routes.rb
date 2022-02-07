Rails.application.routes.draw do
  devise_for :users
  namespace 'api' do
    get 'sessions/new'
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :users
    resources :memos, only: [:create, :destroy]
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
