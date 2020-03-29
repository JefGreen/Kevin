Rails.application.routes.draw do

  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"

  get 'events/new'
  get 'users/new'
  get 'users/create'
  get 'pages/welcome'
  get 'answers/home'
  devise_for :users
  root to: 'pages#home'

  resources :meetings, only: %i(new create index show edit destroy) do
    resources :events, only: %i(new create)
  end

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
