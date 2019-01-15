Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  # Session routes
  get 'login', to: 'session#new'
  post 'session/create', to: "session#create"
  get 'logout', to: 'session#destroy'

  # Pages routes
  get '/about', to: 'pages#about'

  # Post routes 
  resources :posts

end
