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
  resources :categories do
    resources :goals, only: [:new, :create, :delete]
  end
end

