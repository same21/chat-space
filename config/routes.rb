Rails.application.routes.draw do
  devise_for :users
  root   'users#index'
  resources :groups do
    resources :messages
  end
end
