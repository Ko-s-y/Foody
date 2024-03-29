Rails.application.routes.draw do
  root to: 'pages#home'

  # admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :admin_users,
    controllers: {
      sessions: 'admin_users/sessions',
    }

  # user
  devise_for :users,
    path: '',
    path_names: {
      sign_up: 'signup',
      sign_in: 'login',
      sign_out: 'logout',
      edit: 'users/setting',
    },
    controllers: {
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
    }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest' # ゲストユーザー機能
  end

  resources :users, only: [] do # userのroutesはid => nameにしたい為ここでは生成しない
    resource :follows, only: [:create, :destroy]
  end

  get 'users/show' # 自分の詳細画面
  get 'users/:name', to: 'users#profile', as: 'users/profile' # 他ユーザーの詳細画面
  get 'users/:name/followings', to: 'users#followings', as: 'users/followings' # フォロー中ユーザー一覧ページ
  get 'users/:name/followers', to: 'users#followers', as: 'users/followers' # フォロワー一覧ページ
  post 'users/show', to: 'users#update' # アイコン変更

  # post, comment, like, remember
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :remembers, only: [:create, :destroy]
    member do
      get 'action_user'
    end
  end

  # notification
  resources :notifications, only: :index do
    collection do
      get 'checked'
    end
  end

  # contact
  resources :contacts, only: [:index, :new, :create] do
    collection do
      post 'confirm'
    end
  end

  # searches_controller
  get 'searches/result'

  # pages_controller
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'terms', to: 'pages#terms'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
