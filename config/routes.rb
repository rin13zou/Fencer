Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'

   resources :posts, only: [:new, :index, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end

   resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
