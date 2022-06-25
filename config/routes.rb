Rails.application.routes.draw do
  root to: 'pages#home'

  get 'users/:id/show', to: 'users#show'

  devise_for :users
  resources :posts

  get 'users/show', to: 'users#show'
  post 'users/show.:id', to: 'users#update'

  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
