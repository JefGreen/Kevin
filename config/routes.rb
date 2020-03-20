Rails.application.routes.draw do
  get 'group_contacts/new'
  get 'group_contacts/create'
  get 'group_contacts/destroy'
  get 'groups/new'
  get 'groups/create'
  devise_for :users
  root to: 'pages#home'

  resources :contacts do
    resources :likes
    resources :questions, only: %i(new create index)
    resources :answers, only: %i(new create index)
  end

  resources :users, only: %i(new create)
  resources :tags, only: %i(new create)
  resources :groups, only: %i(new create)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
