Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show], param: :slug
  resources :tags, only: [:index, :show], param: :slug
  resources :projects, only: [:index], param: :slug

  get '/about', to: 'pages#about'

  # Admin routing
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Defines the root path route ("/")
  root 'pages#home'
end
