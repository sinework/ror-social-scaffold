Rails.application.routes.draw do

  # get 'friendships/index'
  # get 'friendships/confirm_request'
  # get 'friendships/add_friend'
  # get 'friendships/unfriend'
  # get 'friendships/freind_list'
  # get 'friendships/people_you_may_know'
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
 resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
