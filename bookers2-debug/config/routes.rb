Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/edit'
  get 'groups/show'
  get 'messages/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get "search" => "searches#search"

  resources :messages, only: [:create]
  get 'message/:id', to: 'messages#show', as: 'message'
  resources :rooms, only: [:create, :show]

  resources :groups do
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
