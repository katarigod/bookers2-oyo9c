Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/show'
  get 'homes/edit'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  get 'home/about' => 'homes#about',as: 'about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
