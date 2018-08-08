Rails.application.routes.draw do
  get 'qr_codes/new'
  get 'qr_codes/create'
    get 'dashboard', to: 'slides#dashboard', as: :dashboard

  devise_for :users

  resources :slides do
    resources :comments, only: [ :index, :create, :update, :destroy]

  end
  resources :qr_codes, only: [:new, :create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
