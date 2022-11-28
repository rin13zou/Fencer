Rails.application.routes.draw do

  get 'homes/about'

  # ゲストログインするための記述
  devise_scope :user do
   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  # ゲストユーザーを削除させないための記述
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    password: 'users/passwords'
  }


  root to: 'homes#top'

   resources :posts, only: [:new, :index, :show, :create, :destroy, :update, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end

   resources :users, only: [:show, :edit, :update, :index]

   # 退会確認画面
   get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
   # 論理削除用のルーティング
   patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

   resources :users do

    member do
     get :favorites
    end

    member do
     get :follows, :followers
    end

    resource :relationships, only: [:create, :destroy]
   end

   get "search" => "searches#search"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
