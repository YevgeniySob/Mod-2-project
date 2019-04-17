Rails.application.routes.draw do

  # Main Page
  root 'welcome#home'

  get 'categories/show'
  get '/about', to: 'welcome#about', as: 'about'
  get '/tools/:id/add-tool', to: 'carts#create', as: 'add'

  # Create new tool by the user routes
  get '/user/:id/add-tool', to: 'users#new_tool', as: 'new_tool'
  post '/user/:id', to: 'users#create_tool', as: 'create_tool'

  # Edit tool by the user routes
  get '/user/:id/edit-tool', to: 'users#edit_tool'
  patch '/user/:id', to: 'users#update_tool'

  # Login and logout routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Sign up routes
  get '/signup', to: 'users#new', as: 'signup'





  # get 'carts/index'
  # get 'carts/show'
  # get 'carts/edit'
  # get 'carts/new'
  # get 'tools/index'
  # get 'tools/show'
  # get 'tools/edit'
  # get 'tools/new'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users, except: :index
  resources :categories, only: [:index, :show]
  resources :tools, only: [:index, :show]
  resources :carts
  resources :users, except: [:new]

end
