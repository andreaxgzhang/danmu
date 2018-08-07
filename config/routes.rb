Rails.application.routes.draw do
    get 'dashboard', to: 'slides#dashboard', as: :dashboard

  devise_for :users
  resources :slides do
    resources :comments, only: [ :index, :create, :update, :destroy]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
