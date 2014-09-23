Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  get 'home', to: "home#index"
  get 'portfolio', to: "albums#index"
  get 'dashboard', to: "home#edit", :as => "dashboard"
  get 'sign_up', to: "users#new", :as => "sign_up"
  get 'login', to: "sessions#new", :as => "login"
  get 'logout', to: "sessions#destroy", :as => "logout"


  resources :home
  resources :users, only: [:new, :create]
  resources :sessions
  resources :posts
  resources :albums
  resources :pictures

  #   end
end
