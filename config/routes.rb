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
  get '/dashboard', to: 'users#dashboard', as: :dashboard
  get '/profile/:id', to: 'users#profile', as: :profile
  patch '/update/:id', to: 'users#update', as: :update
  get '/discover', to: 'discovers#index', as: :discovers
  get '/update_goals_number', to: 'users#update_goals_number', as: :update_goals
  patch '/update_goals_number', to: 'users#set_goals', as: :set_goals

  resources :goals, only: [:index, :create, :new, :edit, :update, :destroy] do
    collection do
      patch :privatize_all
    end
  end
  # get 'goals/:id/edit', to: 'goals#edit', as: :edit_goal
  # get '/goals/:id', to: 'goals#show', as: :goal
  # put 'goals/:id', to: 'goals#update'
  # patch 'goals/:id', to: 'goals#update'
  # delete 'goals/:id', to: 'goals#destroy'
  resources :users, only: [] do
    post :save_event, on: :collection
    delete :delete_event, on: :collection
  end
  resources :posts do
    resources :comments, only: [:new, :create]
  end
end

