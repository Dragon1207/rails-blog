Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :show], param: :slug
  resources :tags, only: [:index, :show], param: :slug
  resources :projects, only: [:index, :show], param: :slug

  get '/about', to: 'pages#about'

  # Defines the root path route ("/")
  root 'pages#home'
end
