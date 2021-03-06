Rails.application.routes.draw do
  root to: 'projects#index'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/register', to: 'users#new'

  resources :projects
  resources :tickets do
    resources :comments, except: %i[index show]
  end
  resources :tags
  resources :users
end
