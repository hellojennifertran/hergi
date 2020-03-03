Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  
  resources :categories do
    resources :goals, only: [:new, :create, :delete]
  end
end
