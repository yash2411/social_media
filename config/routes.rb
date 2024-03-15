Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'pages/index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  resources :posts
  resources :likes
  resources :comments
  resources :follows
  resources :profiles, only: [:show]
  post 'add_reply', to: 'comments#add_reply'
  get 'turbo_frame_posts', to: "posts#turbo_frame_posts"
  get 'all_users_posts', to: "posts#all_users_posts"
  delete 'likes', to: 'likes#destroy'
  get 'search_user', to: 'follows#search_user'
  post 'toggle_follow', to: 'follows#toggle_follow'
  get 'friends_list', to: 'follows#friends_list'
  
end
