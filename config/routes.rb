Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]
  
  "users#index"
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  root 'posts#index'
  get 'posts/index'  => 'posts#index'
  get 'posts/new'  => 'postes#new'
  post 'posts/new'  => 'posts#create'


end
