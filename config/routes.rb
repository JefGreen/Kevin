Rails.application.routes.draw do
  get 'questions/new'
  get 'questions/create'
  get 'answers/new'
  get 'answers/create'
  get 'tags/new'
  get 'tags/create'
  get 'likes/new'
  get 'likes/create'
  devise_for :users
  root to: 'pages#home'


resources :stories do
  resources :memories, only: %i(new create)
end


  resources :contacts do
    resources :likes
    resources :questions
    resources :answers, only: %i(new create index)
  end

  resources :users, only: %i(new create)
  resources :tags, only: %i(new create)
  resources :groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
