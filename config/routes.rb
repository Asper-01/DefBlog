Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Pages publiques
  root 'articles#index'
  resources :articles, only: [:index, :show,] do
    resources :comments, only: [:create, :new ]
  end
  resources :tags, only: [:index, :show, :create]


  # Vérification de santé
  get "up" => "rails/health#show", as: :rails_health_check

  # Administration
  namespace :admin do
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :articles, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :comments, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :categories, only: [] do
      member do
        get :tags
      end
    end
    get 'dashboard', to: 'dashboard#index'
  end
end
