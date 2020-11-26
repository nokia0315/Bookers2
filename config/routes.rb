Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :books
  resources :users, only: [:show, :edit, :update, :index]
  post 'users/:id' => 'books#create'

end
