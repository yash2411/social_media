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
  delete 'likes', to: 'likes#destroy'
end
