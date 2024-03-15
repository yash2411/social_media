Rails.application.routes.draw do
  devise_for :users

  root "pages#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :posts do
    resources :likes, except: :destroy
    resources :comments
  end

  resources :follows
  resources :profiles, only: [:show]

  delete 'likes_path', to: 'likes#destroy'
  post 'add_reply', to: 'comments#add_reply'
  get 'turbo_frame_posts', to: "posts#turbo_frame_posts"
  get 'all_users_posts', to: "posts#all_users_posts"
  delete 'likes', to: 'likes#destroy'
  get 'search_user', to: 'follows#search_user'
  post 'toggle_follow', to: 'follows#toggle_follow'
  get 'friends_list', to: 'follows#friends_list'
  
end
