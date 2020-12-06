Rails.application.routes.draw do

  get 'search/search'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  get '/search' => 'search#search'
  resources :users, only: [:show, :edit, :update, :index] do
    member do
     get :follows, :followers
    end
  end
  post 'users/:id' => 'books#create'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
