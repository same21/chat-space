Rails.application.routes.draw do
  devise_for :users
  root   'users#index'
  resources :groups, only:[:new,:create,:edit,:update] do
    resources :messages, only:[:index,:create]
  end
end
