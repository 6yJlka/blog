Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'comments/new'
  get 'comments/create'
  get 'comments/index'
  get 'profiles/show'
  devise_for :users
  resources :blog_posts do
    resources :comments, only: [:new, :create, :index]
  end
  resources :blog_posts

  resources :messages, only: [:index, :new, :create]

  resource :profile, only: [:show, :edit, :update]
  resources :friends, only: [:index, :create, :destroy]

  # Defines the root path route ("/")
  get 'profile', to: 'profiles#show', as: 'user_profile'
  get 'profile/edit', to: 'profiles#edit', as: 'edit_user_profile'
  patch 'profile', to: 'profiles#update' # добавим это, чтобы обработать форму обновления профиля
  root "blog_posts#index"
end
