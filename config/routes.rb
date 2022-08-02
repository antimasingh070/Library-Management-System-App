Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#home'
  get 'books/issue', to: 'books#issue'
  patch 'books/update', to: 'books#update'
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :index, :new, :edit, :update, :create, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get  'books', to: 'books#index'
  resources :books, only: [:show, :index, :new, :create, :edit, :destroy, :issue]
  get 'signup', to: 'users#new'
end
