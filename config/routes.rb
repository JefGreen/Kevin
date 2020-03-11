Rails.application.routes.draw do
  get 'tags/new'
  get 'tags/create'
  get 'likes/new'
  get 'likes/create'
  devise_for :users
  root to: 'pages#home'

  resources :contacts do
    resources :likes
    resources :questions
  end

  resources :users, only: %i(new create)
  resources :tags, only: %i(new create)
  resources :groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
