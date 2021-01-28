Rails.application.routes.draw do
  devise_for :users
  root to: "tweets#index"
  resources :tweets, only:[:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
  resources :users, only: [:index, :show]

  resources :chats, only: [:create] do
    resources :rooms, only: [:create, :show]
  end
end
