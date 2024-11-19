Rails.application.routes.draw do
  devise_for :users

  # Pages publiques
  root 'articles#index'
  resources :articles, only: [:index, :edit, :update, :destroy]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :comments

  # Vérification de santé
  get "up" => "rails/health#show", as: :rails_health_check

  # Administration
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :articles

  end
end
