Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new', as: :unauthentificated_root
    end
  end

  authenticated :user do
    root to: 'pages#home'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/goals', to: 'goals#index'
  post '/goals', to: 'goals#create'
  get '/goals/new', to: 'goals#new', as: :new_goal
  # get 'goals/:id/edit', to: 'goals#edit', as: :edit_goal
  # get '/goals/:id', to: 'goals#show', as: :goal
  # put 'goals/:id', to: 'goals#update'
  # patch 'goals/:id', to: 'goals#update'
  # delete 'goals/:id', to: 'goals#destroy'

  resources :posts
end

