Rails.application.routes.draw do
  devise_for :users

  # Pages publiques
  root 'articles#index'
  resources :articles, only: [:index, :edit, :update, :destroy, :show]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :comments

  # Vérification de santé
  get "up" => "rails/health#show", as: :rails_health_check

  # Administration
  namespace :admin do
    resources :articles
    resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
    get 'dashboard', to: 'dashboard#index'
  end
end
