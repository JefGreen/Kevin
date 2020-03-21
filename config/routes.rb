Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  devise_for :users
  root to: 'pages#home'


resources :stories do
  resources :memories, only: %i(new create)
end


  resources :contacts do
    resources :likes
    resources :questions, only: %i(new create index)
    resources :answers, only: %i(new create index)
    resources :group_contacts, only: %i(new create destroy)
  end

  resources :users, only: %i(new create)
  resources :tags, only: %i(new create)
  resources :groups, only: %i(new create)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
