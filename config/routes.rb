Rails.application.routes.draw do
  root to: 'pages#home'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users

  get 'users/profile/:id', to: 'users#profile' # 他ユーザーの詳細画面
  get 'users/show', to: 'users#show' # 自分の詳細画面
  post 'users/show.:id', to: 'users#update' # 自分のアイコン変更

  get 'pages/home'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
