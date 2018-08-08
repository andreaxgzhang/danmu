Rails.application.routes.draw do
  devise_for :users
  resources :slides, shallow: true do
    resources :comments, only: [ :index, :new, :create]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
