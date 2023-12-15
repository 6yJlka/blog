Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users

  resources :blog_posts
  resource :profile, only: [:show, :edit, :update]
  # Defines the root path route ("/")
  get 'profile', to: 'profiles#show', as: 'user_profile'
  get 'profile/edit', to: 'profiles#edit', as: 'edit_user_profile'
  patch 'profile', to: 'profiles#update' # добавим это, чтобы обработать форму обновления профиля
  root "blog_posts#index"
end
