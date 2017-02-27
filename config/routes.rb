Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :groups, except: %i[ destroy index show] do
    resources :messages, only: %i[ index create]
  end
end
