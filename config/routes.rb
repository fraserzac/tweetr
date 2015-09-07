Rails.application.routes.draw do
  get 'session/new'

  get 'pages/new'

  root :to => 'pages#new'
  resources :users, :posts

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/post' => 'session#post'
end
