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
  get '/goals', to: 'goals#index'
  post '/goals', to: 'goals#create'
  get '/goals/new', to: 'goals#new', as: :new_goal
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

  resources :posts
end

