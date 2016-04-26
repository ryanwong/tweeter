Rails.application.routes.draw do


  root "user_sessions#new"

  resources :users
  resources :posts
  resources :comments, except: [:index, :show]
  resources :user_sessions
  resources :blogs

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
end
