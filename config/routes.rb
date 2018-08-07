Rails.application.routes.draw do
  devise_for :users
  resources :slides do
    resources :comments, only: [ :index, :create]
  end

  resources :users, shallow: true, only: [:show]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
