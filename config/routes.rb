Rails.application.routes.draw do
  get 'session/new'

  get 'pages/new'

  root :to => 'pages#new'
  resources :users, :pages

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/post' => 'session#post'
end
