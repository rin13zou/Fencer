Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'

   resources :posts, only: [:new, :index, :show, :create, :destroy]
   resources :users, only: [:show, :edit]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
