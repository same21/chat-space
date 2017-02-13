Rails.application.routes.draw do
  root   'users#index'
  resources :users
  resources :groups do
    resources :messages
  end

end
