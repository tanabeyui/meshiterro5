Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :members
  get 'homes/about', as: 'about'

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :members, only: [:show, :edit, :update]
end
