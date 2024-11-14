Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles
  resources :tags, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :comments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'admin/dashboard', to: 'admin#dashboard'
  # Routes pour les articles
  resources :articles, except: [:index, :show]
  # Routes pour les tags
  resources :tags, except: [:index, :show]
end
