Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :members
  get 'homes/about', as: 'about'
  
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :members, only: [:show, :edit, :update]
end
