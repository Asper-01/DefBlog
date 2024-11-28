Rails.application.routes.draw do
  devise_for :users

  # Pages publiques
  root 'articles#index'
  resources :articles, only: [:index, :edit, :update, :destroy, :show, :new]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :comments

  # Vérification de santé
  get "up" => "rails/health#show", as: :rails_health_check

  # Administration
  namespace :admin do
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :articles, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :categories, only: [] do
      member do
        get :tags
      end
    end
    get 'dashboard', to: 'dashboard#index'
  end
end
