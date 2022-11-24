Rails.application.routes.draw do

  devise_for :admins,controllers: {
   sessions: 'admins/sessions'
  }

  get 'homes/about'
  devise_for :users
  root to: 'homes#top'

   resources :posts, only: [:new, :index, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end

   resources :users, only: [:show, :edit, :update]

   resources :users do

    member do
     get :favorites
    end

    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
   end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
