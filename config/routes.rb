Rails.application.routes.draw do


  root :to => 'posts#new'
  resources :users, :pages, :posts

  get 'session/new'
  get 'pages/new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/post' => 'session#create'
  get '/account' => 'pages#create'


end
