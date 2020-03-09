Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    devise_scope :user do
      root to: 'pages#home', as: :unauthentificated_root
    end
  end

  authenticated :user do
    root to: 'users#dashboard'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'users#dashboard', as: :dashboard
  get 'profile/:id', to: 'users#profile', as: :profile
  get 'update/:id', to: 'users#update', as: :update
  get 'discovers', to: 'discovers#index', as: :discovers

  resources :goals, only: [:index, :create, :new] do
    collection do
      patch :privatize_all
    end
  end
  # get 'goals/:id/edit', to: 'goals#edit', as: :edit_goal
  # get '/goals/:id', to: 'goals#show', as: :goal
  # put 'goals/:id', to: 'goals#update'
  # patch 'goals/:id', to: 'goals#update'
  # delete 'goals/:id', to: 'goals#destroy'

  resources :posts do
    resources :comments, only: [:new, :create]
  end
end

