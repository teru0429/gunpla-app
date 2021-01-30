Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets, only:[:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  resources :users, only: [:index, :show]
  
  resources :rooms, only: [:create, :show] do
    resources :chats, only: [:create] 
  end
end
