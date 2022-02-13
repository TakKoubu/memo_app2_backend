Rails.application.routes.draw do
  devise_for :users
  namespace 'api' do
    resources :users
    resources :memos, only: [:index, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
