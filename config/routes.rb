Rails.application.routes.draw do
  root 'users#index'

  post '/login' => 'sessions#create'
  delete '/logout/:id' => 'sessions#destroy'

  resources :users

  resources :formations

  post '/join/:id' => 'warriors#create'
  delete '/leave/:id' => 'warriors#destroy'
end
